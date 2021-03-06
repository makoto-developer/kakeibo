import type { NextPage } from 'next'
import Head from 'next/head'
import styles from '../styles/App.module.css'
import Balance from "../components/PageBalance";

const Home: NextPage = () => {
  return (
    <div className={styles.container}>
      <Head>
        <title>家計簿</title>
        <meta name="description" content="Generated by create next app" />
        <link rel="icon" href="/favicon.ico" />
      </Head>
      <main>
        <Balance />
      </main>
    </div>
  )
}

export default Home
