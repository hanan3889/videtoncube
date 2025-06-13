-- Vide Ton Cube - Dump SQL
-- Encodage : utf8mb4
-- Compatible avec MySQL 5.7+

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


-- CREATE USER IF NOT EXISTS 'bloc'@'%' IDENTIFIED BY 'C3si'; 
-- GRANT ALL PRIVILEGES ON videtoncube.* TO 'bloc'@'%';
-- FLUSH PRIVILEGES;



-- Création de la table des utilisateurs
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Insertion des utilisateurs
INSERT INTO users (nom, email) VALUES
('Alice Dupont', 'alice@example.com'),
('Bob Martin', 'bob@example.com'),
('Charly Robert', 'charly@example.com'),
('Charlie Dubois', 'charlie@example.com');

-- Création de la table des objets
CREATE TABLE IF NOT EXISTS objets (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    prix DECIMAL(10,2) NOT NULL,
    image VARCHAR(255),
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Insertion des objets
INSERT INTO objets (nom, prix, image, user_id) VALUES
('Lampe vintage', 12.50, 'lampe-vintage.jpg', 1),
('Game Boy', 25.00, 'game-boy.jpg', 2),
('Jeu de société Monopoly', 15.00, 'monopoly.jpg', 3),
('Collection de timbres', 8.00, 'timbres.jpg', NULL),
('Amiga', 250.00, 'amiga.jpg', 1),
('Nimbus 2000', 18.00, 'nimbus2000.jpg', NULL),
('Parapluie', 320.00, 'parapluie.jpg', 4),
('Tamagotchi', 20.00, 'tamagotchi.jpg', 1),
('Montre', 40.00, 'montre.jpg', 2);
