<?php require_once '../config.php'; ?>
<head>
    <title>Vide ton Cube !</title>
    <link rel="stylesheet" href="styles/styles.css">
    <script>
        // Apply theme immediately to prevent flash of unstyled content
        (function() {
            const theme = localStorage.getItem('theme');
            if (theme === 'dark') {
                document.documentElement.classList.add('dark-theme');
            }
        })();
    </script>
</head>
<body>
    <button id="theme-toggle"></button>

<?php

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

?>

<script>
    const themeToggle = document.getElementById('theme-toggle');
    const docElement = document.documentElement;

    function applyTheme() {
        if (localStorage.getItem('theme') === 'dark') {
            docElement.classList.add('dark-theme');
            themeToggle.textContent = '☀️';
        } else {
            docElement.classList.remove('dark-theme');
            themeToggle.textContent = '🌙';
        }
    }

    themeToggle.addEventListener('click', () => {
        if (docElement.classList.contains('dark-theme')) {
            localStorage.setItem('theme', 'light');
        } else {
            localStorage.setItem('theme', 'dark');
        }
        applyTheme();
    });

    // Apply theme and icon on initial load
    applyTheme();
</script>

</body>