import React from 'react';
import CardInfo from './CardInfo'

function Card(props) {
    return(
        <div className="d-inline-block k-card" onClick={(e) => props.onClick(props.item)}>
            <img className="k-card-image" src={props.item.imgSrc} alt={props.item.imgSrc} />
            { props.item.selected && <CardInfo title={props.item.title} subTitle={props.item.subTitle} link={props.item.link} /> }
        </div>
    );
}

export default Card;