type ButtonType = {
    text: string
    type: 'primary' | 'seconday'
    onClick: VoidFunction
}
const Index = (props: ButtonType) => {
    const {text, onClick} = props

    // TODO typeの制御を書く
    const style = {
        'backgroundColor': 'white',
        'border': '2px solid #46EEFF',
        'borderRadius': '4px',
        'width': '100%',
        'height': '40px'
    }
    return <button style={style} onClick={() => onClick()}>{text}</button>
}

export default Index
