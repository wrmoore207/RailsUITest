import { useEffect, useState } from 'react';
import { getMessages, postMessage } from '../api/messageService';

const Messages = () => {
    const [messages, setMessages] = useState([]);
    const [newMessage, setNewMessage] = useState('');
    const [loading, setLoading] = useState(false);

    // Fetch messages on component mount
    useEffect(() => {
        const fetchMessages = async () => {
            const data = await getMessages();
            setMessages(data);
        };
        fetchMessages();
    }, []);

    // Handle new message submission
    const handleSubmit = async (e) => {
        e.preventDefault();
        if (!newMessage.trim()) return;

        setLoading(true);
        try {
            const result = await postMessage(newMessage);
            if (result) {
                setMessages((prevMessages) => [...prevMessages, result]);
                setNewMessage(''); // Clear the input field after successful submission
            } else {
                console.error('Failed to add message.');
            }
        } catch (error) {
            console.error('Error in handleSubmit:', error);
        } finally {
            setLoading(false);
        }
    };

    return (
        <div>
            <h2>Message Board</h2>
            <div>
                {messages.length > 0 ? (
                    messages.map((msg, index) => (
                        <p key={index}>{msg.content}</p>
                    ))
                ) : (
                    <p>No messages available.</p>
                )}
            </div>

            {/* Form to submit a new message */}
            <form onSubmit={handleSubmit}>
                <input
                    type="text"
                    value={newMessage}
                    onChange={(e) => setNewMessage(e.target.value)}
                    placeholder="Type a new message"
                    required
                />
                <button type="submit" disabled={loading}>
                    {loading ? 'Sending...' : 'Send Message'}
                </button>
            </form>
        </div>
    );
};

export default Messages;
