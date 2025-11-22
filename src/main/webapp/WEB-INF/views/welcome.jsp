<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Welcome — PD Report App</title>
  <!-- Bootstrap 5 CDN -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- jsPDF for client-side PDF generation -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
  <style>
    body { background: #f8f9fa; }
    .hero { padding: 6rem 0; }
    .card-rounded { border-radius: 1rem; }
    video { border-radius: .5rem; }
  </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
  <div class="container">
    <a class="navbar-brand fw-bold" href="#">PD Report App</a>
    <div>
      <button class="btn btn-outline-primary me-2" data-bs-toggle="modal" data-bs-target="#facultyLoginModal">Faculty Login</button>
      <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#studentLoginModal">Student Cam Login</button>
    </div>
  </div>
</nav>

<main class="container hero">
  <div class="row align-items-center">
    <div class="col-md-7">
      <div class="card card-rounded shadow-sm p-4">
        <h1 class="display-6">Welcome to the PD Report App</h1>
        <p class="lead">Faculty and students can log in. Students may log in using a quick camera snapshot (demo). Generate a simple PDF report client-side.</p>
        <ul>
          <li>Bootstrap 5 UI</li>
          <li>Faculty login (email/password)</li>
          <li>Student camera-based login demo (uses webcam snapshot)</li>
          <li>Client-side PDF creation (jsPDF)</li>
        </ul>
        <div class="mt-3">
          <a class="btn btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#generatePdfModal">Generate Sample PDF</a>
        </div>
      </div>
    </div>
    <div class="col-md-5 text-center">
      <img src="https://cdn.jsdelivr.net/gh/twitter/twemoji@14.0.2/assets/svg/1f4c4.svg" alt="report" width="140" class="mb-3">
      <div class="card card-rounded shadow-sm p-3">
        <h5 class="mb-2">Quick Actions</h5>
        <button class="btn btn-primary w-100 mb-2" data-bs-toggle="modal" data-bs-target="#facultyLoginModal">Faculty Login</button>
        <button class="btn btn-success w-100" data-bs-toggle="modal" data-bs-target="#studentLoginModal">Student Cam Login</button>
      </div>
    </div>
  </div>
</main>

<!-- Faculty Login Modal -->
<div class="modal fade" id="facultyLoginModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Faculty Login</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <div class="modal-body">
        <form id="facultyLoginForm">
          <div class="mb-3">
            <label class="form-label">Email</label>
            <input type="email" class="form-control" id="facultyEmail" required>
          </div>
          <div class="mb-3">
            <label class="form-label">Password</label>
            <input type="password" class="form-control" id="facultyPassword" required>
          </div>
          <div class="d-grid">
            <button class="btn btn-primary" type="submit">Login</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

<!-- Student Cam Login Modal -->
<div class="modal fade" id="studentLoginModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Student Cam Login</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col-md-7 text-center">
            <video id="video" width="100%" autoplay playsinline></video>
            <div class="mt-2">
              <button id="captureBtn" class="btn btn-success me-2">Capture Snapshot</button>
              <button id="stopCamBtn" class="btn btn-outline-danger">Stop Camera</button>
            </div>
          </div>
          <div class="col-md-5">
            <form id="studentForm">
              <div class="mb-3">
                <label class="form-label">Student ID</label>
                <input type="text" class="form-control" id="studentId" required>
              </div>
              <div class="mb-3">
                <label class="form-label">Name</label>
                <input type="text" class="form-control" id="studentName" required>
              </div>
              <div class="mb-3">
                <label class="form-label">Snapshot</label>
                <div id="snapshotPreview" class="border rounded p-2">No snapshot yet</div>
              </div>
              <div class="d-grid">
                <button class="btn btn-primary" type="submit">Login (Demo)</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Generate PDF Modal (simple demo) -->
<div class="modal fade" id="generatePdfModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Generate Sample PDF Report</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <div class="modal-body">
        <form id="pdfForm">
          <div class="mb-3">
            <label class="form-label">Report Title</label>
            <input class="form-control" id="reportTitle" value="Student PD Report">
          </div>
          <div class="mb-3">
            <label class="form-label">Notes</label>
            <textarea class="form-control" id="reportNotes" rows="4">This is a sample report generated client-side.</textarea>
          </div>
          <div class="d-grid">
            <button class="btn btn-success" type="submit">Create PDF</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

<footer class="py-4 text-center">
  <small class="text-muted">© PD Report App</small>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
// ---------- Faculty login (demo only) ----------
document.getElementById('facultyLoginForm').addEventListener('submit', function(e){
  e.preventDefault();
  const email = document.getElementById('facultyEmail').value;
  // Demo: replace with real authentication call to your backend.
  alert('Faculty logged in (demo): ' + email);
  var modal = bootstrap.Modal.getInstance(document.getElementById('facultyLoginModal'));
  modal.hide();
});

// ---------- Student camera login ----------
let stream = null;
const video = document.getElementById('video');
const captureBtn = document.getElementById('captureBtn');
const stopCamBtn = document.getElementById('stopCamBtn');
const snapshotPreview = document.getElementById('snapshotPreview');

async function startCamera(){
  try{
    stream = await navigator.mediaDevices.getUserMedia({ video: true, audio: false });
    video.srcObject = stream;
  } catch(err){
    snapshotPreview.innerHTML = '<div class="text-danger">Camera not available or permission denied.</div>';
  }
}

function stopCamera(){
  if(stream){
    stream.getTracks().forEach(t => t.stop());
    stream = null;
    video.srcObject = null;
  }
}

// Start camera when modal opens
var studentModalEl = document.getElementById('studentLoginModal');
studentModalEl.addEventListener('shown.bs.modal', startCamera);
studentModalEl.addEventListener('hidden.bs.modal', stopCamera);

captureBtn.addEventListener('click', function(){
  if(!stream){ alert('Camera not started'); return; }
  const canvas = document.createElement('canvas');
  canvas.width = video.videoWidth;
  canvas.height = video.videoHeight;
  const ctx = canvas.getContext('2d');
  ctx.drawImage(video, 0, 0, canvas.width, canvas.height);
  const dataUrl = canvas.toDataURL('image/png');
  snapshotPreview.innerHTML = '<img src="'+dataUrl+'" alt="snapshot" class="img-fluid rounded">';
  // Store snapshot in a hidden input or s