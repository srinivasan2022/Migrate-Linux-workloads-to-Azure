#!/bin/bash
dnf install -y httpd php php-pgsql git
systemctl enable --now httpd

cat <<EOF > /var/www/html/orders.php
<?php
$host = '10.0.0.4';
$port = '5432';
$dbname = 'northwind';
$user = 'demouser';
$password = 'demopass123';

$dsn = "pgsql:host=$host;port=$port;dbname=$dbname;user=$user;password=$password";

try {
  $pdo = new PDO($dsn);
  if ($pdo) {
    $serverInfo = $pdo->query("SELECT inet_server_addr() AS server_name")->fetch(PDO::FETCH_ASSOC);
    echo "<h2>Connected to Database Server: " . htmlspecialchars($serverInfo['server_name']) . "</h2>";
    $stmt = $pdo->query("SELECT * FROM order_details");
    echo "<table border='1'><tr><th>Order ID</th><th>Product ID</th><th>Unit Price</th><th>Quantity</th><th>Discount</th></tr>";
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
      echo "<tr>";
      echo "<td>" . htmlspecialchars($row['order_id']) . "</td>";
      echo "<td>" . htmlspecialchars($row['product_id']) . "</td>";
      echo "<td>" . htmlspecialchars($row['unit_price']) . "</td>";
      echo "<td>" . htmlspecialchars($row['quantity']) . "</td>";
      echo "<td>" . htmlspecialchars($row['discount']) . "</td>";
      echo "</tr>";
    }
    echo "</table>";
  }
} catch (PDOException $e) {
  echo $e->getMessage();
}
?>
EOF
