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
                <p className="k-title">
                    Contact
                </p>
                <div>
                    <p className="k-container-bg" style={{padding: '20vh', fontSize:'1.2vw'}}>
                        If you have any questions or suggestions about my Policy or Terms and Conditions, do not hesitate to contact me at ypin.master@gmail.com.
                    </p>
                </div>
            </div>
        )
    }
};

export default Contact;