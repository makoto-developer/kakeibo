import "react-datepicker/dist/react-datepicker.css";
import s from './style.module.scss'

import {useForm} from "react-hook-form";
import {DatePicker} from "../DatePicker";
import {useState} from "react";
import {useRouter} from "next/router";
import Button from "../Button";
import ApiClient from "../../util/api";

const Add = () => {
  const defaultValues = {
    amount: 0,
    datetime: null,
    method: null,
    test: null,
    sss: null
  }
  const router = useRouter()

  type Inputs = {
    expense: number;
    date: string;
    method: string
  };
  const {register, control, handleSubmit, watch, formState: {errors}} = useForm();
  console.log('register:', register)
  const [check, setCheck] = useState('現金')

  const putBalance = async () => {
    // field :day, :date
    // field :expense, :integer
    // field :income, :integer
    // field :method, :string
    // field :title, :string
    // field :who, :string

    const postData = {
      day: '',
      expense: '',
      income: '',
      method: '',
      title: '',
      who: '',

    }
    return await ApiClient.post("/api/balance/", postData)
      .then(res => res.data)
  }

  const onSubmit = (data: any) => {
    const postBalance = async () => {
      return await ApiClient.post("/api/balance/", data)
        .then(res => res.data)
        .catch(error => console.error('cuase error:', error))
    }
    postBalance()
  }
  const payMethods = ['現金', 'd-card', 'jal-card']

  const errorMessage = () => {
    if (errors?.amount?.type !== "required") return <></>
    let message = ''
    switch (errors.amount.type) {
      case 'min':
        message = '0円以上を入力してください'
        break
      case 'max':
        message = '5,000,000円未満を入力してください'
        break
      case 'pattern':
        message = '数値を入力してください'
        break
    }
    return <span style={{'color': 'red'}}>{message}</span>
  }

  return <div>
    <div className={s.root}>
      <Button name={'戻る'} onClick={() => router.back()} />
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
              defaultValue='0'
              {...register("expense", {min: 0, max: 5_000_000, required: true, pattern: /^[\d]+$/i})}
              style={{
                'height': '40px',
                'width': '50%',
                'fontSize': '20px'
              }}
            />
            <div>
              {errorMessage()}
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
              id='item-1'
              className='radio-inline__input'
              type='radio'
              name='accessible-radio'
              value='現金'
              checked={check === '現金'}
            />

            <label className='radio-inline__label' onClick={() => setCheck('現金')}>
              現金
            </label>
            <input
              {...register("method")}
              id='item-2'
              className='radio-inline__input'
              type='radio'
              name='accessible-radio'
              value='d-card'
              checked={check === 'd-card'}
            />
            <label className='radio-inline__label' onClick={() => setCheck('d-card')}>
              d-card
            </label>
            <input
              {...register("method")}
              id='item-3'
              className='radio-inline__input'
              type='radio'
              name='accessible-radio'
              value='jal-card'
              checked={check === 'jal-card'}
            />
            <label className='radio-inline__label' onClick={() => setCheck('jal-card')}>
              jal-card
            </label>
            {errors?.method?.type && errors.method.type === "required" &&
            <span style={{'color': 'red'}}>必須です</span>}
          </div>
          <div>
            <DatePicker
              {...register("date")}
              label='datetime'
              name='datetime'
              control={control}
              error={errors?.datetime?.message}
            />
          </div>
          <input
            type='submit'
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
  </div>
}

export default Add
