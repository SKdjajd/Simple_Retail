# 🛍️ Retail Simple (Versión Corregida)

[![License MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Multi-DB](https://img.shields.io/badge/DB-Multi-orange.svg)]()

## 📋 Descripción
Retail básico: Productos, Ventas, Clientes, Empleados, Auditoría precios. **FIX**: Tipos datos (INT/DECIMAL).

## 🚀 Requisitos
Oracle/SQL Server/PG/MySQL.

## 📖 Pasos

### 1. DDL
```bash
sqlplus @schema_universal.sql
```

### 2. Demo
```bash
@demo_practica.sql
```
Muestra ventas, cambios precio, stock.

### 3. Queries
```sql
SELECT p.Nombre, p.Stock_Actual, p.Precio_unitario FROM Productos p ORDER BY p.Precio_unitario;
-- Ventas por Cliente
SELECT c.Nombre, COUNT(v.ID_venta) FROM Clientes c JOIN Ventas v ON c.ID_CLI = v.Clientes_ID_CLI GROUP BY c.Nombre;
```

## 🛠️ Mejoras
- Implementar triggers reales para stock/auditoría.

## 📊 Diagrama ER Interactivo
Abre [`diagrama_relaciones.html`](diagrama_relaciones.html):

[![ER Simple](https://mermaid.ink/img/pako:eNp1VUlt2zAQhP9Kz1kSWLuSUweXMXMhUllMYtYl__cKaEFg_6mJ-gwFBr0KrtxDqZo9g9gWvS-wBlvXOn9sYgSqqDwtZ3wtR7B7JuSqVoNqwzZ8xDypfIzyzEuwCtSDrYWcRfXkv5aU3T6_7fV3__L8JqQ4euT4gOKL4r__fziv4rA)]

**Visualiza relaciones** en browser.


**GitHub Ready!**

