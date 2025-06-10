/* General Body and Page Layout */
body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background-color: #f0f2f5; /* Light gray background */
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh; /* Full viewport height */
    margin: 0;
    color: #333;
    font-size: 18px; /* Base font size for better readability on larger screens */
    line-height: 1.6; /* Improved line spacing */
}

/* Quiz Container Styling */
.quiz-container {
    background-color: #ffffff; /* White background for the quiz box */
    padding: 35px 50px; /* Increased padding */
    border-radius: 12px; /* Slightly more rounded corners */
    box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15); /* More prominent shadow */
    width: 90%; /* Occupy 90% of screen width */
    max-width: 900px; /* Maximum width on large screens */
    text-align: center;
    box-sizing: border-box; /* Include padding in width */
}

/* Heading */
h1 {
    color: #2c3e50; /* Darker blue-gray for heading */
    margin-bottom: 30px;
    font-size: 2.5em; /* Larger heading font size */
    font-weight: 700; /* Bolder */
}

/* Vietnamese Sentence Display */
#vietnamese-sentence {
    font-size: 1.6em; /* Significantly larger font size for the question */
    margin-bottom: 35px;
    font-weight: bold;
    color: #0056b3; /* Primary blue color */
    background-color: #e6f7ff; /* Lighter blue background */
    padding: 20px 25px; /* More padding for the sentence */
    border-radius: 10px;
    border-left: 6px solid #007bff; /* Thicker left border */
    line-height: 1.5;
}

/* Options Container */
#options-container {
    display: flex;
    flex-direction: column;
    gap: 18px; /* Increased space between options */
    margin-bottom: 30px;
}

/* Option Buttons */
.option-btn {
    background-color: #f8f9fa; /* Lighter gray background */
    border: 1px solid #dee2e6; /* Light border */
    color: #495057; /* Dark gray text */
    padding: 18px 25px; /* More padding for buttons */
    text-align: left;
    font-size: 1.2em; /* Larger font size for options */
    border-radius: 9px;
    cursor: pointer;
    transition: all 0.3s ease; /* Smooth transitions */
    width: 100%;
    box-sizing: border-box;
}

.option-btn:hover:not(.correct):not(.incorrect) {
    background-color: #e2f0e6; /* Light green on hover */
    border-color: #28a745; /* Green border on hover */
    color: #212529; /* Slightly darker text on hover */
}

.option-btn.selected {
    border-color: #007bff; /* Blue border when selected */
    background-color: #e9f2f7; /* Light blue background when selected */
    box-shadow: 0 0 0 0.25rem rgba(0, 123, 255, 0.25); /* Glow effect when selected */
}

.option-btn.correct {
    background-color: #28a745; /* Green for correct answer */
    color: white;
    border-color: #28a745;
    pointer-events: none; /* Disable click after answer */
    box-shadow: 0 0 0 0.25rem rgba(40, 167, 69, 0.25); /* Green glow */
}

.option-btn.incorrect {
    background-color: #dc3545; /* Red for incorrect answer */
    color: white;
    border-color: #dc3545;
    pointer-events: none; /* Disable click after answer */
    box-shadow: 0 0 0 0.25rem rgba(220, 53, 69, 0.25); /* Red glow */
}

/* General Button Styling */
button {
    background-color: #007bff; /* Primary blue button */
    color: white;
    border: none;
    padding: 14px 30px; /* More padding */
    font-size: 1.2em; /* Larger font size for buttons */
    border-radius: 9px;
    cursor: pointer;
    transition: background-color 0.3s ease, transform 0.2s ease;
    margin-top: 20px;
    box-shadow: 0 4px 10px rgba(0, 123, 255, 0.2);
}

button:hover {
    background-color: #0056b3; /* Darker blue on hover */
    transform: translateY(-2px); /* Slight lift effect */
    box-shadow: 0 6px 15px rgba(0, 123, 255, 0.3);
}

button:active {
    transform: translateY(0);
    box-shadow: 0 2px 5px rgba(0, 123, 255, 0.2);
}

/* Feedback Message */
#feedback {
    margin-top: 25px;
    font-size: 1.4em; /* Larger feedback font size */
    font-weight: bold;
    min-height: 1.5em; /* Ensure space even when empty */
}

#feedback.correct-feedback {
    color: #28a745; /* Green for correct feedback */
}

#feedback.incorrect-feedback {
    color: #dc3545; /* Red for incorrect feedback */
}

/* Score Area */
#score-area {
    margin-top: 40px;
    font-size: 1.3em; /* Larger score font size */
    font-weight: bold;
    color: #555;
    border-top: 1px solid #e0e0e0; /* Lighter top border */
    padding-top: 25px;
}

#score, #total-questions {
    color: #007bff; /* Blue color for numbers */
}

/* Hide these buttons initially (controlled by JS) */
#next-btn, #restart-btn {
    display: none;
}

/* Responsive adjustments */
@media (max-width: 768px) {
    .quiz-container {
        padding: 25px 30px; /* Reduce padding on smaller screens */
        width: 95%; /* Take up more width on smaller screens */
    }

    h1 {
        font-size: 2em; /* Smaller heading */
    }

    #vietnamese-sentence {
        font-size: 1.4em; /* Adjust sentence font size */
        padding: 18px 20px;
    }

    .option-btn {
        font-size: 1.1em; /* Adjust option font size */
        padding: 15px 20px;
    }

    button {
        font-size: 1.1em; /* Adjust button font size */
        padding: 12px 25px;
    }

    #feedback {
        font-size: 1.2em; /* Adjust feedback font size */
    }

    #score-area {
        font-size: 1.1em; /* Adjust score font size */
    }
}

@media (max-width: 480px) {
    .quiz-container {
        padding: 20px;
        border-radius: 8px;
    }

    h1 {
        font-size: 1.8em;
        margin-bottom: 20px;
    }

    #vietnamese-sentence {
        font-size: 1.2em;
        padding: 15px;
        margin-bottom: 25px;
    }

    .option-btn {
        font-size: 1em;
        padding: 12px 15px;
    }

    button {
        font-size: 1em;
        padding: 10px 20px;
    }

    #feedback {
        font-size: 1.1em;
    }
}