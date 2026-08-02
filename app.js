// app.js — Team Dashboard
console.log("Dashboard loaded — v1.0.0");

document.addEventListener("DOMContentLoaded", () => {
  const badge = document.querySelector(".version-badge");
  if (badge) {
    badge.title = "Current production release";
  }
});
