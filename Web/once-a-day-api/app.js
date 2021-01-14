const express = require('express');
const bodyParser = require('body-parser'); // set the body to set an extra info
const cors = require('cors'); // cross origin resource sharing -> 
const sendGrid = require('@sendgrid/mail');
const sendGridApiKey = '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'


const app = express();

app.use(bodyParser.json());
app.use(cors()); // Has to be instantiated
app.use((req, res, next) => {
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, PATCH, DELETE');
    res.setHeader('Access-Control-Allow-Headers', 'Content-Type, Authorization');
    next();
});

// req - information on the request, if we want to access the request object
// res - what we are sending back
// next - if we want to be allowed to go on something else
app.get('/api', (req, res, next) => { // good way how to debug -> when the address is loaded means server is running
    res.send('API Status: Running')
}); 

app.post('/api/email', (req, res, next) => {
    // sgMail.setApiKey(process.env.sendGridApiKey)
    sendGrid.setApiKey('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'); // Generated key from sendGrid website, very unique
    const msg = {
        to: 'kucharmartin0@gmail.com',
        from: req.body.email,
        subject: 'Website Contact',
        text: req.body.message
    }

    sendGrid.send(msg)
        .then(result => { // better call result instead res becasue of clarity
            res.status(200).json({
                success: true
            });
        })
        
        .catch(err => {
            console.log('error: ', err);
            res.status(401).json({
                success: false
            });
        });
});

// Listen on local host 3030 -> than we can add /api
app.listen(3030, '0.0.0.0');