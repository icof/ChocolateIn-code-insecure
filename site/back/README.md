# ChocolateIn - Back-office

Interface d'administration pour la gestion du site ChocolateIn.

## 🚀 Installation

### 1. Installer les dépendances js

```bash
npm install
```

## 📁 Structure

```
back/
├── controleurs/          # Contrôleurs MVC
├── modele/              # Modèles de données
├── vues/                # Vues (templates HTML/PHP)
├── bibliotheques/       # Scripts personnalisés
│   └── perso/
├── node_modules/        # Dépendances npm (ignoré par Git)
├── package.json         # Configuration npm
└── index.php           # Point d'entrée
```

## 🔧 Configuration

Les dépendances sont chargées depuis `node_modules/` dans `vues/entete.html.php`

## 📝 Notes

- Le dossier `node_modules/` n'est pas versionné (voir `.gitignore`)
- Toujours exécuter `npm install` après un `git clone`
- Les bibliothèques personnalisées restent dans `bibliotheques/perso/`
