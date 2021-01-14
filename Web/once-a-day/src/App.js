import React from 'react';
import {BrowserRouter as Router, Route, Link} from 'react-router-dom';
import Container from 'react-bootstrap/Container';
import Dropdown from 'react-bootstrap/Dropdown';
import Navbar from 'react-bootstrap/Navbar';
import Nav from 'react-bootstrap/Nav';
import './App.css';
import firebase from 'firebase';

// Import the components I've made
import Footer  from './components/Footer';
import Home from './pages/Home';
import About from './pages/Policy';
import AboutT from './pages/TermsAndConditions';
import Contact from './pages/Contact';
import backgroundPic from './assets/images/city.png';

import 'bootstrap/dist/css/bootstrap.css';

// Current styles
const styles = {
  paperContainer: {
    backgroundColor: `RGBA(0, 0, 0, 0.9)`,
    height:'100%', 
    width: '100%',
  }
};

class App extends React.Component {

  constructor(props) {
    super(props)
    this.state = {
      title: 'Martin Kuchar',
      headerLinks: [
        {title: 'Home', path: '/'},
        {title: 'Policy', path: '/policy'},
        {title: 'Policy', path: '/termsandcontitions'},
        {title: 'Contact', path: '/contact'}
      ],
      home: {
        totalCount: 'once-a-day',
      }, 
      policy: {
        title: 'Policy',
      },
      tAndC: {
        title: 'Terms & Conditions',
      },
      contact: {
        title: 'Contact Us'
      }
    }
  }

  // Lifecycle method of the components
  componentDidMount() {
    // Real time DB
    const db = firebase.database()
    const dbRef = db.ref().child('totalCount')
    // Set a listener, sync data on real time 
    dbRef.on('value', snap => {
      this.setState({
        home: {
          totalCount: snap.val(),
        }
      })
    })
  }

  render() {
    return (
      <Router>
          <Container id="page-container" fluid={true} style={styles.paperContainer} >
            <Navbar className="border-bottom" bg="transparent" expand="lg" >
              <Navbar.Brand style={{ color: 'white' }} >ONCE A DAY</Navbar.Brand>

              <Navbar.Toggle className="border-0" arja-aria-controls="navbar-toggle"/>
              <Navbar.Collapse id="navbar-toggle">
                <Nav className="ml-auto" > 
                  <Link style={{ color: 'white' }} className="nav-link" to="/">Home</Link>
                  <Dropdown>
                    <Dropdown.Menu>
                      <Dropdown.Item href="#/action-1">Action</Dropdown.Item>
                      <Dropdown.Item href="#/action-2">Another action</Dropdown.Item>
                      <Dropdown.Item href="#/action-3">Something else</Dropdown.Item>
                    </Dropdown.Menu>
                  </Dropdown>
                  <Link style={{ color: 'white' }} className="nav-link" to="/policy">Policy</Link>
                  <Link style={{ color: 'white' }} className="nav-link" to="/termsandconditions">Terms & Conditions</Link>
                  <Link style={{ color: 'white' }} className="nav-link" to="/contact">Contact</Link>
                </Nav>
              </Navbar.Collapse>
            </Navbar>
            <div id="content-wrap">
              <Route path="/" exact render={() => <Home title={this.state.home.totalCount} /> } />
          
              <Route path="/policy" render={() => <About title={this.state.policy.title} /> } />

              <Route path="/termsandconditions" exact render={() => <AboutT title={this.state.tAndC.title} /> } />

              <Route path="/contact" render={() => <Contact title={this.state.contact.title} /> } />
            </div>
            <div>
              <Footer/>
            </div>
          </Container>
      </Router>
    );
  }
}

export default App;
