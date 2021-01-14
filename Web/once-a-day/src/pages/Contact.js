import React from 'react';
import Myself from '../components/Myself';
import Content from '../components/Content';
import Form from 'react-bootstrap/Form';
import Button from 'react-bootstrap/Button';
import Axios from 'axios';

class Contact extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            name: '',
            email: '',
            message: '',
            disabled: false,
            emailSent: null,
        }
    }

    handleChange = (event) => {
        const target = event.target;
        const value = target.type === 'checkbox' ? target.checked : target.value; // if the input was checkbox then value is checkbox
        const name = target.name;
        this.setState({
            [name]: value
        });
    }

    handleSubmit = (event) => {
        event.preventDefault(); // prevent refreshing after submiting the form

        this.setState({
            disabled: true,
            emailSent: false
        });


        // We pass the whole state, and in backend we choose what we actually need
        Axios.post('http://localhost:3030/api/email', this.state)
            .then(res => {
                if(res.data.success) {
                    this.setState({
                        disabled: false,
                        emailSent: true
                    });
                } else {
                    this.setState({
                        disabled: false, 
                        emailSent: false
                    });
                }
            }).catch(err => {
                this.setState({
                    disabled: false,
                    emailSent: false
                });
            })
    }

    render() {
        return(
            <div>
                <Myself title={this.props.title} />

                    <div style={{display: 'flex',  justifyContent:'center', alignItems:'center', height: '50vh', backgroundColor: 'white', opacity: 0.8 }}>
                        <p className="display-5 font-weight-bolder">
                            If you have any questions or suggestions about my Policy or Terms and Conditions, do not hesitate to contact me at ypinapp@gmail.com.
                        </p>
                    </div>

                {/* <Content>
                    <Form onSubmit={this.handleSubmit}>
                        <Form.Group>
                            <Form.Label htmlFor="full-name">Full Name</Form.Label>
                            <Form.Control id="full-name" name="name" type="text" value={this.state.name} onChange={this.handleChange}></Form.Control>
                        </Form.Group>
                        <Form.Group>
                            <Form.Label htmlFor="email">Email</Form.Label>
                            <Form.Control id="email" name="email" type="email" value={this.state.email} onChange={this.handleChange}></Form.Control>
                        </Form.Group>
                        <Form.Group>
                            <Form.Label htmlFor="message">Message</Form.Label>
                            <Form.Control id="message" name="message" as="textarea" rows="3" value={this.state.message} onChange={this.handleChange}></Form.Control>
                        </Form.Group>

                        <Button className="d-inline-block" variant="primary" type="submit" disabled={this.state.disabled}>
                            Send
                        </Button>
                        { this.state.emailSent === true && <p className="d-inline success-msg">Email Sent</p> }
                        { this.state.emailSent === false && <p className="d-inline err-msg">Email Not Sent</p> }
                    </Form>
                </Content> */}
            </div>
        )
    }
};

export default Contact;