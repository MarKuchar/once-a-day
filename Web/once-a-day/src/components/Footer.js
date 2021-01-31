import React from 'react';
import Container from 'react-bootstrap/Container';
import Row from 'react-bootstrap/Row';
import Col from 'react-bootstrap/Col';

function Footer() {
    return(
        <footer>
            <Container fluid={true} style={{paddingTop: '0px', textAlign: 'center', widht: '100%',}} >
                {/* <Row className="p-3 height:60px"> */}
                    {/* <Col md={3} style={{ color: 'black' }}> */}
                        © Copyright Y Team
                    {/* </Col> */}
                {/* </Row> */}
            </Container>  
        </footer>
    );
};
export default Footer;