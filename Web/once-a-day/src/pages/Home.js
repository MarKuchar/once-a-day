import React from 'react';
import Carousel from '../components/Carousel';
import Myself from '../components/Myself';

function Home(props) {
    return(
        <div style={{textAlign:'center', marginTop: '40vh', marginBottom: '20vh'}}>
            <p3>
               <Myself title={props.title} subTitle={props.subTitle} text={props.text} />
            </p3>
        </div>
    );
};

export default Home;