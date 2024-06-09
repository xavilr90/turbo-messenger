import Head from 'next/head';
import { useEffect, useState } from 'react';

export default function Home() {
  const [data, setData] = useState(null)

  useEffect(() => {
    fetch('/api/clientes')
      .then((res) => res.json())
      .then((data) => {
        setData(data)
      })
  }, [])

  return (
    <div>
      <h1>TurboMessenger</h1>
      <div>{data && data.map(item => <p>{Object.values(item).join(', ')}</p>)}</div>
    </div>
  );
}
