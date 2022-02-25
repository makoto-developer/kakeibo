import "react-datepicker/dist/react-datepicker.css";

import {useForm} from "react-hook-form";
import {DatePicker} from "../../components/DatePicker";
import {useState} from "react";


const Add = () => {
    const defaultValues = {
        amount: 0,
        datetime: null,
        method: null,
        test: null,
        sss: null
    }
    const {register, control, handleSubmit, watch, formState: {errors}} = useForm();
    const [check, setCheck] = useState('現金')

    const onSubmit = (data: any) => console.log(data);
    const payMethods = ['現金', 'd-card', 'jal-card']

    return <div style={{}}>
        <div style={{
            'display': 'flex',
            'justifyContent': 'center',
            'alignItems': 'center',
            'minHeight': '100vh',
            'textAlign': 'center'
        }}>
            <form onSubmit={handleSubmit(onSubmit)}>
                <label>金額</label>
                <div style={{
                    'textAlign': 'center'
                }}>
                    <input
                        defaultValue="0"
                        {...register("amount", {min: 0, max: 5_000_000, required: true, pattern: /^[\d]+$/i})}
                        style={{
                            'height': '40px',
                            'width': '50%',
                            'fontSize': '20px'
                        }}
                    />
                    <div>
                        {errors?.amount?.type && errors.amount.type === "required" &&
                            <span style={{'color': 'red'}}>必須です</span>}
                        {errors?.amount?.type && errors.amount.type === "min" &&
                            <span style={{'color': 'red'}}>0円以上を入力してください</span>}
                        {errors?.amount?.type && errors.amount.type === "max" &&
                            <span style={{'color': 'red'}}>5,000,000円未満を入力してください</span>}
                        {errors?.amount?.type && errors.amount.type === "pattern" &&
                            <span style={{'color': 'red'}}>数値を入力してください</span>}
                    </div>
                </div>
                <label style={{
                    'display': 'inlineBlock',
                    'marginTop': '20px'
                }}>支払い方法</label>
                <div
                    style={{
                        'display': 'flex',
                        'justifyContent': 'spaceEvenly',
                        'alignItems': 'center',
                        'border': 'none'
                    }}>
                    <input
                        {...register("method")}
                        id="item-1"
                        className="radio-inline__input"
                        type="radio"
                        name="accessible-radio"
                        value="現金"
                        checked={check === '現金'}
                    />

                    <label className="radio-inline__label" onClick={() => setCheck('現金')}>
                        現金
                    </label>
                    <input
                        {...register("test")}
                        id="item-2"
                        className="radio-inline__input"
                        type="radio"
                        name="accessible-radio"
                        value="d-card"
                        checked={check === 'd-card'}
                    />
                    <label className="radio-inline__label" onClick={() => setCheck('d-card')}>
                        d-card
                    </label>
                    <input
                        {...register("sss")}
                        id="item-3"
                        className="radio-inline__input"
                        type="radio"
                        name="accessible-radio"
                        value="jal-card"
                        checked={check === 'jal-card'}
                    />
                    <label className="radio-inline__label" onClick={() => setCheck('jal-card')}>
                        jal-card
                    </label>
                    {errors?.method?.type && errors.method.type === "required" &&
                        <span style={{'color': 'red'}}>必須です</span>}
                </div>
                <div>

                    <DatePicker
                        label="datetime "
                        name="datetime"
                        control={control}
                        error={errors?.datetime?.message}
                    />
                </div>
                <input
                    type="submit"
                    style={{
                        'backgroundColor': '#66CCFF',
                        'border': 'none',
                        'width': '90vw',
                        'height': '30px',
                        'flexShrink': '0',
                        'marginTop': '10px'
                    }}
                />
            </form>
        </div>
    </div>
}

export default Add
