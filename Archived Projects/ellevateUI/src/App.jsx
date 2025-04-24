import { BrowserRouter as Router, Route, Routes, Link } from 'react-router-dom';
import { NavigationMenu } from '@radix-ui/react-navigation-menu';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faHouse } from '@fortawesome/free-solid-svg-icons';
import { faMessage, faCalendar } from '@fortawesome/free-regular-svg-icons';
import './App.css';
import Calendar from './components/Calander';
import Messages from './components/Messages';
import Weather from './components/Weather';

function App() {
    return (
        <Router>
            <div>
                {/* Navigation Menu using Radix UI with Blue background and positioned at the top */}
                <NavigationMenu className="bg-blue-800 text-white fixed w-full top-0 z-10 shadow-md">
                    <div className="flex flex-row justify-start space-x-6 p-4">
                        <div>
                            <Link to="/" className="p-2 hover:bg-blue-700 rounded">
                                <FontAwesomeIcon icon={faHouse} className="mr-2" />
                                <span> Home</span>
                            </Link>
                        </div>
                        <div>
                            <Link to="/calendar" className="p-2 hover:bg-blue-700 rounded">
                                <FontAwesomeIcon icon={faCalendar} className="mr-2" />
                                <span> Calendar</span>
                            </Link>
                        </div>
                        <div>
                            <Link to="/weather" className="p-2 hover:bg-blue-700 rounded">
                                <span>Weather</span>
                            </Link>
                        </div>
                        <div>
                            <Link to="/messages" className="p-2 hover:bg-blue-700 rounded">
                                <FontAwesomeIcon icon={faMessage} className="mr-2" />
                                <span> Messages</span>
                            </Link>
                        </div>
                    </div>
                </NavigationMenu>

                {/* Content Below Navbar (to avoid overlap) */}
                <div className="mt-20">
                    <Routes>
                        <Route path="/" element={<Home />} />
                        <Route path="/calendar" element={<Calendar />} />
                        <Route path="/weather" element={<Weather />} />
                        <Route path="/messages" element={<Messages />} />
                    </Routes>
                </div>
            </div>
        </Router>
    );
}

function Home() {
    return <h2>Welcome to the ESOL Resources Platform</h2>;
}

export default App;
