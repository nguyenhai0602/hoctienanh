document.addEventListener('DOMContentLoaded', function() {
    // Logic ẩn/hiện nội dung topic (từ ví dụ trước, giữ nguyên)
    const topicSections = document.querySelectorAll('.topic-section');

    topicSections.forEach(section => {
        const h2 = section.querySelector('h2');
        if (h2) {
            h2.addEventListener('click', function() {
                const content = Array.from(section.children).filter(child => child !== h2);
                content.forEach(element => {
                    if (element.style.display === 'none') {
                        element.style.display = '';
                    } else {
                        element.style.display = 'none';
                    }
                });
            });
        }
    });

    // --- Hàm để xáo trộn các phần tử ---
    function shuffleElements(parentElement) {
        let children = Array.from(parentElement.children);
        for (let i = children.length - 1; i > 0; i--) {
            const j = Math.floor(Math.random() * (i + 1));
            [children[i], children[j]] = [children[j], children[i]];
        }
        children.forEach(child => parentElement.appendChild(child));
    }

    // --- Hàm để reset trạng thái câu hỏi ---
    function resetQuestionState(container) {
        const options = container.querySelectorAll('.option');
        const feedbackDiv = container.querySelector('.feedback');

        options.forEach(option => {
            option.classList.remove('correct', 'incorrect'); // Xóa màu
            option.style.pointerEvents = 'auto'; // Kích hoạt lại click
        });

        feedbackDiv.classList.remove('show', 'correct-feedback', 'incorrect-feedback'); // Ẩn và xóa màu feedback
        feedbackDiv.textContent = ''; // Xóa nội dung feedback
    }


    // --- Logic cho các câu hỏi tương tác ---
    const questionContainers = document.querySelectorAll('.question-container');

    questionContainers.forEach(container => {
        const optionsContainer = container.querySelector('.options');
        const feedbackDiv = container.querySelector('.feedback');
        const shuffleButton = container.querySelector('.shuffle-button'); // Lấy nút shuffle
        let selectedCorrectCount = 0;
        let totalCorrectOptions = 0;

        // Xáo trộn các lựa chọn lần đầu khi trang tải xong
        if (optionsContainer) {
            shuffleElements(optionsContainer);
        }

        // --- Cập nhật lại totalCorrectOptions và gán event listeners ---
        // Hàm này sẽ được gọi cả khi tải trang và khi xáo trộn lại
        function initializeQuestionOptions() {
            selectedCorrectCount = 0; // Reset số đáp án đúng đã chọn
            totalCorrectOptions = 0; // Reset tổng số đáp án đúng

            const options = optionsContainer.querySelectorAll('.option'); // Lấy lại các options sau khi xáo trộn (nếu có)
            options.forEach(option => {
                if (option.dataset.correct === 'true') {
                    totalCorrectOptions++;
                }
                // Gỡ bỏ listener cũ nếu có để tránh trùng lặp
                option.removeEventListener('click', handleOptionClick);
                // Gán listener mới
                option.addEventListener('click', handleOptionClick);
            });
        }

        // Khởi tạo lần đầu
        initializeQuestionOptions();

        // --- Hàm xử lý sự kiện click cho option ---
        function handleOptionClick() {
            // "this" ở đây là option được click
            if (this.classList.contains('correct') || this.classList.contains('incorrect')) {
                return; // Không làm gì nếu đã có màu (đã được chọn)
            }

            const isCorrect = this.dataset.correct === 'true';

            if (isCorrect) {
                this.classList.add('correct');
                selectedCorrectCount++;
            } else {
                this.classList.add('incorrect');
            }

            if (selectedCorrectCount === totalCorrectOptions) {
                feedbackDiv.textContent = 'Tuyệt vời! Bạn đã chọn đúng tất cả.';
                feedbackDiv.classList.remove('incorrect-feedback');
                feedbackDiv.classList.add('correct-feedback', 'show');
                // Vô hiệu hóa tất cả các lựa chọn sau khi trả lời đúng
                optionsContainer.querySelectorAll('.option').forEach(opt => opt.style.pointerEvents = 'none');
            } else if (!isCorrect && selectedCorrectCount < totalCorrectOptions) {
                feedbackDiv.textContent = 'Chưa chính xác. Hãy thử lại!';
                feedbackDiv.classList.remove('correct-feedback');
                feedbackDiv.classList.add('incorrect-feedback', 'show');
                // Chỉ ẩn thông báo sau một thời gian ngắn nếu là sai
                setTimeout(() => {
                    feedbackDiv.classList.remove('show');
                    feedbackDiv.textContent = '';
                    this.classList.remove('incorrect'); // Xóa màu đỏ để có thể chọn lại
                }, 1500); // Ẩn sau 1.5 giây
            } else if (isCorrect && selectedCorrectCount < totalCorrectOptions) {
                 // Nếu chọn đúng nhưng chưa đủ số đáp án đúng
                feedbackDiv.textContent = 'Một đáp án đúng! Hãy tìm thêm.';
                feedbackDiv.classList.remove('incorrect-feedback');
                feedbackDiv.classList.add('correct-feedback', 'show');
                setTimeout(() => {
                    feedbackDiv.classList.remove('show');
                    feedbackDiv.textContent = '';
                }, 1000); // Ẩn sau 1 giây
            }
        }

        // --- Logic cho nút xáo trộn ---
        if (shuffleButton) {
            shuffleButton.addEventListener('click', function() {
                resetQuestionState(container); // Reset trạng thái trước
                shuffleElements(optionsContainer); // Xáo trộn
                initializeQuestionOptions(); // Khởi tạo lại listeners và đếm đáp án đúng sau khi xáo trộn
            });
        }
    });
});