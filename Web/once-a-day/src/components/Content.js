import React from 'react';
import Col from 'react-bootstrap/esm/Col';
import Container from 'react-bootstrap/esm/Container';
import Row from 'react-bootstrap/esm/Row';

function Content(props) {
    return(
        <Container fluid={true}>
            <Row className="justify-content-center" >
                <Col md={8}>
                    {/* Everything we put inside 'Content' tags */}
                    {props.children}
                </Col>
            </Row>
        </Container>
    );
};

export default Content;