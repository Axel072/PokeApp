# 📱 My Poke App

Una aplicación Flutter basada en la PokeAPI que permite buscar, explorar y visualizar pokémons por generación, además de guardar favoritos y disfrutar de funciones como trivia.

---

## 🧭 Navegación principal

La pantalla de inicio presenta una interfaz intuitiva con acceso directo a las siguientes secciones:

- 🔍 Search  
- 🎴 Pokemons  
- 📊 Generations  
- ❓ Trivia  
- ❤️ Favorites  

<p align="center">
  <img src="/lib/assets/demo/menu.jpeg" width="300" alt="Pantalla principal de la app">
</p>

---

## 🧠 Tecnologías utilizadas

- **Riverpod** para la gestión de estado reactiva, usando `StateNotifier`, `Consumer` y `Provider`
- **GoRouter** para el manejo eficiente y declarativo de rutas
- Estructura modular por capas: `domain`, `infrastructure`, `presentation`, `configure`

---

## ⚙️ Funcionalidades

### 🔄 Navegación fluida con GoRouter

### 🔁 Gestión de estado reactiva con Riverpod

---

### 🔍 Búsqueda de pokémons por nombre

<p align="center">
  <img src="/lib/assets/demo/search.jpeg" width="300" alt="Pantalla de búsqueda de la app">
</p>

<p align="center">
  <img src="/lib/assets/demo/search_example.jpeg" width="300" alt="Ejemplo de búsqueda de pokémon">
</p>

---

### 🧬 Exploración por generaciones

<p align="center">
  <img src="/lib/assets/demo/generations_options.jpeg" width="300" alt="Opciones de generaciones">
</p>

<p align="center">
  <img src="/lib/assets/demo/generations.jpeg" width="300" alt="Pokémons de una generación">
</p>

---

### 📚 Lista de todos los pokémons

<p align="center">
  <img src="/lib/assets/demo/pokemons.jpeg" width="300" alt="Pantalla de todos los pokémons">
</p>

---
### 📚 Stats Pokemon
En cualquiera de las pantllas anteriores haciendo click se despliega un pop-up con detalles del pokemon
<p align="center">
  <img src="/lib/assets/demo/pokemons_card.jpeg" width="300" alt="Pantalla de todos los pokémons">
</p>

<p align="center">
  <img src="/lib/assets/demo/card_example.jpeg" width="300" alt="Pantalla de todos los pokémons">
</p>

---


### 🧠 Trivia interactiva *(en desarrollo 🚧)*

### ❤️ Sistema de favoritos local *(en desarrollo 🚧)*