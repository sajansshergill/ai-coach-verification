// Main app.js for index.html

// Check server status on page load
async function checkServerStatus() {
    try {
        const response = await fetch('/api/health');
        const data = await response.json();
        
        const statusIndicator = document.getElementById('status-indicator');
        if (data.status === 'ok') {
            statusIndicator.className = 'status-success';
            statusIndicator.textContent = '✅ Server is running';
        } else {
            statusIndicator.className = 'status-error';
            statusIndicator.textContent = '⚠️ Server status unknown';
        }
    } catch (error) {
        const statusIndicator = document.getElementById('status-indicator');
        statusIndicator.className = 'status-error';
        statusIndicator.textContent = '❌ Cannot connect to server. Make sure the server is running.';
    }
}

// Check status when page loads
if (document.getElementById('status-indicator')) {
    checkServerStatus();
}
