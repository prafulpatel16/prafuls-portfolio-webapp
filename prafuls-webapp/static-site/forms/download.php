<?php
// API Gateway endpoint to call the Lambda function
$apiUrl = 'https://your-api-gateway-endpoint.com/getResumeLink';  // Replace with your actual API Gateway endpoint

// Make a request to the API to get the pre-signed URL
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $apiUrl);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
$response = curl_exec($ch);
curl_close($ch);

if ($response === false) {
    die('Error occurred while fetching the resume link.');
}

// Parse the JSON response
$data = json_decode($response, true);

// Check if the download URL is present
if (isset($data['download_url'])) {
    // Redirect to the pre-signed URL
    header("Location: " . $data['download_url']);
    exit;
} else {
    die('Error: Unable to fetch the resume download link.');
}
?>
<?php
// API Gateway endpoint to call the Lambda function
$apiUrl = 'https://your-api-gateway-endpoint.com/getResumeLink';  // Replace with your actual API Gateway endpoint

// Make a request to the API to get the pre-signed URL
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $apiUrl);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
$response = curl_exec($ch);
curl_close($ch);

if ($response === false) {
    die('Error occurred while fetching the resume link.');
}

// Parse the JSON response
$data = json_decode($response, true);

// Check if the download URL is present
if (isset($data['download_url'])) {
    // Redirect to the pre-signed URL
    header("Location: " . $data['download_url']);
    exit;
} else {
    die('Error: Unable to fetch the resume download link.');
}
?>
