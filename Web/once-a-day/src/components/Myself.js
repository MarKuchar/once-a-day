import React from 'react';
import Container from 'react-bootstrap/esm/Container';
import Jumbotron from 'react-bootstrap/Jumbotron';
import Row from 'react-bootstrap/Row';
import Col from 'react-bootstrap/Col';

function Myself(props) {
    return(
        <Jumbotron className="bg-transparent jumbotron-fluid p-0">
            <Container fluid={true}>
                <Row className="justify-content-center">
                    <Col md={8} sm={12}>
                        { props.title && <h1 className="display-3 font-weight-bolder"  style={{ color: 'white' }} >{props.title}</h1> }
                        { props.subTitle && <h3 className="display-5 font-weight-bolder" style={{ color: 'white' }} >{props.subTitle}</h3> }
                        { props.text && <h3 className="lead font-weight-light" style={{ color: 'white' }} >{props.text}</h3> }
                    </Col>
                </Row>
            </Container>
        </Jumbotron>
    );
};

export default Myself;