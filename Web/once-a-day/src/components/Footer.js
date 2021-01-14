import React from 'react';
import Container from 'react-bootstrap/Container';
import Row from 'react-bootstrap/Row';
import Col from 'react-bootstrap/Col';

function Footer() {
    return(
        <footer >
            <div className="panel-footer " style={{marginTop: '10vh'}}>
                <Container fluid={true} >
                    <Row className="border-top justify-content-between p-3 height:60px ">
                    
                        <Col className="p-0" md={3} sm={12} style={{ color: 'white' }}>
                            Y
                        </Col>
                        <Col className="p-0 d-flex justify-content-end" md={3} style={{ color: 'white' }}>
                            © Copyright Y Team
                        </Col>
                    </Row>
                </Container>
            </div>
        </footer>
    );
};
export default Footer;