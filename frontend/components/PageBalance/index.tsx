import dayjs from 'dayjs';
import ApiClient from "../../util/api";
import {useEffect, useState} from "react";
import Index from "../Button";
import {useRouter} from "next/router";

type BalanceType = {
    day: string,
    expense: number,
    id: number,
    income: number,
    title: string,
    method: string,
    who: string,
}

const Balance = () => {
    const router = useRouter()
    const fetchBalance = async () => {
        return await ApiClient.get("/api/balance/")
            .then(res => res.data)
    }
    // response example
    // const response = [
    //     {day: "2022-01-25", expense: 2000, id: 3, income: 0, title: "昼ごはん", who: "alice"},
    //     {day: "2022-02-25", expense: 7000, id: 1, income: 0, title: "ガソリン", who: "tom"},
    //     {day: "2022-01-25", expense: 0, id: 2, income: 250000, title: "振り込み", who: "tom"}
    // ]

    useEffect(() => {
        fetchBalance().then(res => setBalanceData(res.data)
        )
    }, [])
    const [balanceData, setBalanceData] = useState<Array<BalanceType>>([])
    const shapingData = (list: Array<BalanceType>) => list.sort((a: BalanceType, b: BalanceType) => {
        if (dayjs(a.day).isAfter(b.day)) {
            return 1
        } else {
            return -1
        }
    }).reduce((acc: Array<
        BalanceType & { balance: number }>, val: BalanceType) => {
        if (acc.length === 0) {
            acc.push({...val, balance: (val.income - val.expense)})
            return acc
        }
        acc.push({...val, balance: (val.income - val.expense + acc[acc.length - 1].balance)})
        return acc
    }, [])
        .reverse()

    console.log("balanceData:", balanceData)
    const data = shapingData(balanceData)
    return (
        <div>
            <Index text={'追加'} type={'primary'} onClick={() => router.push('/add')} />
            <table>
                <thead>
                <tr>
                    <th>日付</th>
                    <th>入金/出費</th>
                    <th>残高</th>
                    <th>人</th>
                </tr>
                </thead>
                <tbody>
                {
                    data.map(balance => {
                        return <tr key={balance.id}>
                            <td>{dayjs(balance.day).format('M/D')}</td>
                            {
                                balance.expense === 0 &&
                                <td style={{'color': '#009966'}}>{balance.income.toLocaleString()}</td>
                            }
                            {
                                balance.income === 0 &&
                                <td style={{'color': '#FF3333'}}>-{balance.expense.toLocaleString()}</td>
                            }
                            <td>{balance.balance.toLocaleString()}</td>
                            <td>{balance.title}/{balance.method}</td>
                            <td>{balance.who}</td>
                        </tr>
                    })
                }
                </tbody>
            </table>
        </div>
    )
}

export default Balance
