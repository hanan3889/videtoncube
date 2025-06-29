<?php

    $host = getenv('DB_HOST');
    $db   = getenv('DB_DATABASE');
    $user = getenv('DB_USERNAME'); 
    $pass = getenv('DB_PASSWORD');
    $port = getenv('DB_PORT'); 

?>
<head>
    <title>Vide ton Cube !</title>
    <link rel="stylesheet" href="styles/styles.css">
</head>

<?php

try {
    $pdo = new PDO("mysql:host=$host;dbname=$db;charset=utf8", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $stmt = $pdo->query("
        SELECT objets.nom AS objet_nom, objets.prix, objets.image, users.nom AS vendeur
        FROM objets
        LEFT JOIN users ON objets.user_id = users.id
    ");

    echo "<h1>Liste des objets en vente</h1><ul>";
    echo "<div style=\"text-align: center;\">
        <input type=\"text\" id=\"searchInput\" placeholder=\"Rechercher un objet...\" style=\"margin-bottom: 20px; padding: 5px; width: 300px;\">
        </div>";
    echo "<script>
        document.getElementById('searchInput').addEventListener('input', function() {
            const filter = this.value.toLowerCase();
            document.querySelectorAll('ul > li').forEach(function(item) {
                const text = item.textContent.toLowerCase();
                item.style.display = text.includes(filter) ? '' : 'none';
            });
        });
    </script>";

    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        $vendeur = $row['vendeur'] ? htmlspecialchars($row['vendeur']) : "Anonyme";
        $imagePath = $row['image'] ? "images/" . htmlspecialchars($row['image']) : "images/default.jpg";
        echo "<li style='margin-bottom: 20px;'>";
        echo "<strong>" . htmlspecialchars($row['objet_nom']) . "</strong> — " . number_format($row['prix'], 2) . " €<br>";
        echo "<em>Vendu par : $vendeur</em><br>";
        echo "<img src='$imagePath' alt='Image de l\'objet' style='max-height:150px;'><br>";
        echo "</li>";
    }
    echo "</ul>";

} catch (PDOException $e) {
    echo "Erreur : " . $e->getMessage();
}
