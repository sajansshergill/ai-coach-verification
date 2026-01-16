// API base URL - automatically detects if running on GitHub Pages or production
const API_BASE_URL = window.location.hostname === 'sajansshergill.github.io' || 
                     window.location.hostname.includes('github.io')
    ? 'https://your-backend-url.vercel.app' // Replace with your actual backend URL
    : window.location.origin;

// Check system status
async function checkStatus() {
    const statusIndicator = document.getElementById('status-indicator');
    if (!statusIndicator) return;

    try {
        const response = await fetch(`${API_BASE_URL}/api/health`);
        if (response.ok) {
            const data = await response.json();
            statusIndicator.innerHTML = `✅ ${data.message || 'System is running'}`;
            statusIndicator.style.color = 'var(--success)';
        } else {
            throw new Error('Server not responding');
        }
    } catch (error) {
        // If on GitHub Pages, show note about backend requirement
        if (window.location.hostname.includes('github.io')) {
            statusIndicator.innerHTML = `
                ⚠️ Static Preview Mode<br>
                <small style="font-size: 0.875rem; opacity: 0.8;">
                    Full functionality requires backend server. 
                    See <a href="https://github.com/sajansshergill/ai-coach-verification/blob/main/DEPLOYMENT.md" target="_blank" style="color: var(--primary);">deployment guide</a>.
                </small>
            `;
            statusIndicator.style.color = 'var(--warning)';
        } else {
            statusIndicator.innerHTML = `❌ Unable to connect to server. Make sure the backend is running.`;
            statusIndicator.style.color = 'var(--danger)';
        }
    }
}

// Check status on page load
document.addEventListener('DOMContentLoaded', checkStatus);
