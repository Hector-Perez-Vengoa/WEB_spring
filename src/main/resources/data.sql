-- Insertar datos de ejemplo en la base de datos H2
-- Este archivo se ejecutará automáticamente al iniciar la aplicación

-- Insertar usuarios de ejemplo
INSERT INTO users (username, email, password, first_name, last_name, role, active, created_at, updated_at) VALUES
('admin', 'admin@tecsup.edu.pe', '$2a$10$8K8mYKJQQRuFBwBdpJCgReVmjjRLO.JqVjHgVqOXZjGLwTjzUNRVe', 'Admin', 'Sistema', 'ADMIN', true, NOW(), NOW()),
('user1', 'user1@tecsup.edu.pe', '$2a$10$8K8mYKJQQRuFBwBdpJCgReVmjjRLO.JqVjHgVqOXZjGLwTjzUNRVe', 'Usuario', 'Prueba', 'USER', true, NOW(), NOW());

-- Insertar productos de ejemplo
INSERT INTO products (name, description, price, stock, category, active, created_at, updated_at) VALUES
('Laptop Dell', 'Laptop Dell Inspiron 15 3000', 1200.00, 10, 'Electrónicos', true, NOW(), NOW()),
('Mouse Logitech', 'Mouse inalámbrico Logitech MX Master 3', 89.99, 25, 'Accesorios', true, NOW(), NOW()),
('Teclado Mecánico', 'Teclado mecánico RGB Corsair K95', 150.00, 15, 'Accesorios', true, NOW(), NOW()),
('Monitor Samsung', 'Monitor Samsung 24 pulgadas Full HD', 299.99, 8, 'Electrónicos', true, NOW(), NOW());

-- Nota: La contraseña para ambos usuarios es "password123"
