type ButtonType = {
    text: string
    type: 'primary' | 'seconday'
    action: VoidFunction
}
const Button = (props: ButtonType) => {
    const {text, action} = props

    // TODO typeの制御を書く
    const style = {
        'backgroundColor': 'white',
        'border': '2px solid #46EEFF',
        'borderRadius': '4px',
        'width': '100%',
        'height': '40px'
    }
    return <button style={style} onClick={() => action()}>{text}</button>
}

export default Button
