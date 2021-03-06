import React from 'react';
import {BrowserRouter as Router, Route, Link} from 'react-router-dom';
import Container from 'react-bootstrap/Container';
import icon from './assets/images/icon.png'
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

import 'bootstrap/dist/css/bootstrap.css';

// Current styles
const styles = {
  paperContainer: {
    backgroundColor: `RGBA(255, 252, 240, 1)`,
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
        totalCount: '...',
      }, 
      policy: {
        subTitle: 'Policy',
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
            <Navbar className="k-navbar-style" expand="lg" >
              <Navbar.Brand style={{ color: 'rgba(92, 117,182)'}} >
              <Link to={'/'}>
                <img className="k-icon-image" src={icon} alt={icon} />
              </Link>
              </Navbar.Brand>

              <Navbar.Toggle className="border-0" arja-aria-controls="navbar-toggle"/>
              <Navbar.Collapse id="navbar-toggle">
                <Nav className="ml-auto" > 
                  <Link style={{ color: 'black', fontSize: '1.2em' }} className="nav-link" to="/">World's count</Link>
                  <Link style={{ color: 'black', fontSize: '1.2em' }} className="nav-link" to="/policy">Policy</Link>
                  <Link style={{ color: 'black', fontSize: '1.2em' }} className="nav-link" to="/termsandconditions">Terms & Conditions</Link>
                  <Link style={{ color: 'black', fontSize: '1.2em' }} className="nav-link" to="/contact">Contact</Link>
                </Nav>
              </Navbar.Collapse>
            </Navbar>
            <div id="content-wrap">
              <Route path="/" exact render={() => <Home title={this.state.home.totalCount} /> } />
          
              <Route path="/policy" render={() => <About subTitle={this.state.policy.subTitle} /> } />

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
