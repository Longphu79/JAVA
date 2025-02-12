<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Upload Avatar</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <style>
        body {
            background: linear-gradient(to right, #ff9a9e, #fad0c4);
            font-family: 'Poppins', sans-serif;
        }
        .upload-container {
            max-width: 500px;
            margin: 50px auto;
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
            text-align: center;
        }
        .upload-container h3 {
            font-weight: bold;
            color: #333;
        }
        .drop-area {
            border: 2px dashed #007bff;
            border-radius: 10px;
            padding: 30px;
            text-align: center;
            background: #f8f9fa;
            cursor: pointer;
            transition: 0.3s;
        }
        .drop-area:hover {
            background: #e9ecef;
        }
        .drop-area i {
            font-size: 40px;
            color: #007bff;
        }
        .preview-img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            margin-top: 15px;
            display: none;
            border: 3px solid #007bff;
        }
        .btn-custom {
            background: #007bff;
            color: white;
            border-radius: 25px;
            padding: 10px 20px;
            transition: 0.3s;
        }
        .btn-custom:hover {
            background: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="upload-container">
            <h3>Upload Your Avatar</h3>
            <p class="text-muted">Choose an image or drag & drop it here.</p>
            
            <div class="drop-area" id="drop-area">
                <i class="fas fa-cloud-upload-alt"></i>
                <p>Drag & Drop Image Here</p>
                <input type="file" id="fileInput" name="file" accept="image/*" hidden>
            </div>

            <img id="previewImg" class="preview-img" src="#" alt="Preview">

            <form action="UploadServlet" method="post" enctype="multipart/form-data" class="mt-3">
                <input type="file" class="form-control" name="file" id="fileChooser" accept="image/*" required>
                <button type="submit" class="btn btn-custom mt-3 w-100">💾 Upload</button>
            </form>

            <a href="Profile.jsp" class="btn btn-secondary mt-3 w-100">🔙 Back to Profile</a>
        </div>
    </div>

    <script>
        const dropArea = document.getElementById('drop-area');
        const fileInput = document.getElementById('fileInput');
        const fileChooser = document.getElementById('fileChooser');
        const previewImg = document.getElementById('previewImg');

        // Click event to open file chooser
        dropArea.addEventListener('click', () => fileInput.click());

        // Show preview when selecting file
        fileChooser.addEventListener('change', (event) => {
            const file = event.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = (e) => {
                    previewImg.src = e.target.result;
                    previewImg.style.display = 'block';
                };
                reader.readAsDataURL(file);
            }
        });

        // Drag & Drop functionality
        dropArea.addEventListener('dragover', (event) => {
            event.preventDefault();
            dropArea.style.background = "#e9ecef";
        });

        dropArea.addEventListener('dragleave', () => {
            dropArea.style.background = "#f8f9fa";
        });

        dropArea.addEventListener('drop', (event) => {
            event.preventDefault();
            dropArea.style.background = "#f8f9fa";

            const file = event.dataTransfer.files[0];
            if (file) {
                fileInput.files = event.dataTransfer.files;
                const reader = new FileReader();
                reader.onload = (e) => {
                    previewImg.src = e.target.result;
                    previewImg.style.display = 'block';
                };
                reader.readAsDataURL(file);
            }
        });
    </script>
</body>
</html>