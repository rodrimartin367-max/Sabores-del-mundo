SET NAMES 'utf8mb4';

CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    visitas INT DEFAULT 0,
    rol VARCHAR(20) DEFAULT 'USER'
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE reservas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    restaurante VARCHAR(50) NOT NULL,
    comensales INT NOT NULL,
    fecha_hora DATETIME NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id) ON DELETE CASCADE
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS platos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pais VARCHAR(50),
    tipo_menu VARCHAR(20),
    categoria VARCHAR(20),
    dia_semana VARCHAR(20),
    nombre VARCHAR(100),
    descripcion TEXT,
    precio VARCHAR(50),
    imagen VARCHAR(255)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

TRUNCATE TABLE platos;

-- ==========================================
-- BEBIDAS - ESPAÑA
-- ==========================================
INSERT INTO platos (pais, tipo_menu, categoria, dia_semana, nombre, descripcion, precio, imagen) VALUES
('Espana', 'bebida', 'bebida', 'Todos', 'Vino Tinto / Blanco / Rosado (Copa)', 'Copa de vino de la casa.', '3,50 €', NULL),
('Espana', 'bebida', 'bebida', 'Todos', 'Jarra de Agua', 'Agua del grifo.', '0,00 €', NULL),
('Espana', 'bebida', 'bebida', 'Todos', 'Botella de Agua Aquabona 500ml', 'Botella de agua mineral.', '2,20 €', NULL),
('Espana', 'bebida', 'bebida', 'Todos', 'Cerveza (Tercio/Doble)', 'Cerveza de barril o botella.', '2,80 €', NULL),
('Espana', 'bebida', 'bebida', 'Todos', 'Refresco', 'Coca-Cola, Fanta, Sprite, Nestea.', '2,70 €', NULL);

-- ==========================================
-- ESPAÑA - MENÚ DEL DÍA (L-V)
-- ==========================================
INSERT INTO platos (pais, tipo_menu, categoria, dia_semana, nombre, descripcion, precio, imagen) VALUES
('Espana', 'dia', 'primero', 'Lunes', 'Gazpacho Andaluz', 'Sopa fría tradicional a base de tomate y hortalizas frescas.', NULL, NULL),
('Espana', 'dia', 'primero', 'Lunes', 'Ensalada de Pimientos Asados', 'Pimientos asados con atún y un toque de aceite de oliva.', NULL, NULL),
('Espana', 'dia', 'segundo', 'Lunes', 'Pescaíto Rebozado al Horno', 'Fritura tradicional andaluza servida con ensalada fresca.', NULL, NULL),
('Espana', 'dia', 'segundo', 'Lunes', 'Pollo al Ajillo', 'Receta clásica de pollo dorado con abundantes ajos.', NULL, NULL),
('Espana', 'dia', 'postre', 'Lunes', 'Pastel Cordobés', 'Dulce tradicional de hojaldre relleno de cabello de ángel.', NULL, NULL),
('Espana', 'dia', 'postre', 'Lunes', 'Fruta de Temporada', 'Selección de la mejor fruta fresca del día.', NULL, NULL),

('Espana', 'dia', 'primero', 'Martes', 'Ensalada Valenciana', 'Ensalada fresca típica de la huerta valenciana.', NULL, NULL),
('Espana', 'dia', 'primero', 'Martes', 'Puchero Valenciano', 'Caldo tradicional reconfortante con carnes y verduras.', NULL, NULL),
('Espana', 'dia', 'segundo', 'Martes', 'Paella de Pollo y Verduras', 'Arroz tradicional con el auténtico sabor valenciano.', NULL, NULL),
('Espana', 'dia', 'segundo', 'Martes', 'Sepia a la Plancha', 'Sepia a la plancha con ajo y perejil.', NULL, NULL),
('Espana', 'dia', 'postre', 'Martes', 'Fartons', 'Dulce típico ideal para poner el broche de oro a la comida.', NULL, NULL),
('Espana', 'dia', 'postre', 'Martes', 'Fruta de Temporada', 'Selección de la mejor fruta fresca del día.', NULL, NULL),

('Espana', 'dia', 'primero', 'Miercoles', 'Purrusalda', 'Caldo tradicional vasco a base de puerro y patata.', NULL, NULL),
('Espana', 'dia', 'primero', 'Miercoles', 'Revuelto de Perretxikos', 'Huevos revueltos con setas típicas de temporada.', NULL, NULL),
('Espana', 'dia', 'segundo', 'Miercoles', 'Bacalao al Pil-Pil', 'Lomo de bacalao confitado con su salsa tradicional.', NULL, NULL),
('Espana', 'dia', 'segundo', 'Miercoles', 'Txuleta de Ternera con Pimientos', 'Carne a la brasa acompañada de pimientos asados.', NULL, NULL),
('Espana', 'dia', 'postre', 'Miercoles', 'Goxua', 'Postre vasco a base de bizcocho, crema y nata.', NULL, NULL),
('Espana', 'dia', 'postre', 'Miercoles', 'Fruta de Temporada', 'Selección de la mejor fruta fresca del día.', NULL, NULL),

('Espana', 'dia', 'primero', 'Jueves', 'Caldo Gallego', 'Potaje tradicional gallego con grelos, alubias y patatas.', NULL, NULL),
('Espana', 'dia', 'primero', 'Jueves', 'Pulpo a Feira', 'Pulpo cocido con pimentón, aceite de oliva y sal gruesa.', NULL, NULL),
('Espana', 'dia', 'segundo', 'Jueves', 'Merluza a la Gallega', 'Lomo de merluza con ajada y pimientos del padrón.', NULL, NULL),
('Espana', 'dia', 'segundo', 'Jueves', 'Lacón con Grelos', 'Plato tradicional de cerdo con verduras cocidas.', NULL, NULL),
('Espana', 'dia', 'postre', 'Jueves', 'Tarta de Santiago', 'Bizcocho clásico de almendras y azúcar glass.', NULL, NULL),
('Espana', 'dia', 'postre', 'Jueves', 'Fruta de Temporada', 'Selección de la mejor fruta fresca del día.', NULL, NULL),

('Espana', 'dia', 'primero', 'Viernes', 'Sopa Castellana', 'Sopa de ajo tradicional con pan, pimentón y huevo.', NULL, NULL),
('Espana', 'dia', 'primero', 'Viernes', 'Judiones de la Granja', 'Guiso tradicional de alubias blancas gigantes.', NULL, NULL),
('Espana', 'dia', 'segundo', 'Viernes', 'Lechazo Asado', 'Cordero lechal tierno asado al horno de leña.', NULL, NULL),
('Espana', 'dia', 'segundo', 'Viernes', 'Trucha a la Plancha', 'Trucha fresca dorada a la plancha.', NULL, NULL),
('Espana', 'dia', 'postre', 'Viernes', 'Cañas Zamoranas', 'Dulce frito relleno de deliciosa crema pastelera.', NULL, NULL),
('Espana', 'dia', 'postre', 'Viernes', 'Fruta de Temporada', 'Selección de la mejor fruta fresca del día.', NULL, NULL);

-- ==========================================
-- ESPAÑA - MENÚ INFANTIL
-- ==========================================
INSERT INTO platos (pais, tipo_menu, categoria, dia_semana, nombre, descripcion, precio, imagen) VALUES
('Espana', 'infantil', 'infantil', 'Todos', 'Puré de Verduras', 'Crema suave de verduras de temporada.', NULL, NULL),
('Espana', 'infantil', 'infantil', 'Todos', 'Espaguetis a la Boloñesa', 'Pasta con salsa de tomate natural.', NULL, NULL),
('Espana', 'infantil', 'infantil', 'Todos', 'Arroz Tres Delicias', 'Arroz salteado con guisantes, jamón y tortilla.', NULL, NULL),
('Espana', 'infantil', 'infantil', 'Todos', 'Hamburguesa Casera', 'Hamburguesa con patata al horno.', NULL, NULL),
('Espana', 'infantil', 'infantil', 'Todos', 'Pechuga de Pollo', 'Filete de pechuga con ensalada de tomate y maíz.', NULL, NULL),
('Espana', 'infantil', 'infantil', 'Todos', 'Palitos de Merluza al Horno', 'Merluza con ensalada de tomate.', NULL, NULL),
('Espana', 'infantil', 'infantil', 'Todos', 'Yogur Natural', 'Yogur cremoso suave.', NULL, NULL),
('Espana', 'infantil', 'infantil', 'Todos', 'Fruta', 'Pieza de fruta del día.', NULL, NULL);

-- ==========================================
-- ESPAÑA - MENÚ FIN DE SEMANA
-- ==========================================
INSERT INTO platos (pais, tipo_menu, categoria, dia_semana, nombre, descripcion, precio, imagen) VALUES
('Espana', 'finde', 'entrante', 'Sabado', 'Tabla de Ibéricos', 'Selección premium de jamón, lomo y embutidos ibéricos.', '15,50 €', NULL),
('Espana', 'finde', 'entrante', 'Sabado', 'Patatas Bravas', 'Cubos de patata crujientes por fuera y tiernos por dentro, bañados en salsa brava.', '6,50 €', NULL),
('Espana', 'finde', 'entrante', 'Sabado', 'Croquetas de Jamón', 'Bechamel cremosa y trocitos de jamón ibérico, con un empanado dorado.', '5,00 €', NULL),
('Espana', 'finde', 'entrante', 'Sabado', 'Ensaladilla Rusa', 'Nuestra versión clásica con patata, atún de calidad, guisantes y mayonesa.', '5,50 €', NULL),
('Espana', 'finde', 'entrante', 'Sabado', 'Tortilla de Patata', 'Jugosa, hecha al momento con huevos de corral y patatas seleccionadas.', '6,90 €', NULL),
('Espana', 'finde', 'primero', 'Sabado', 'Fabada Asturiana', 'Un guiso contundente de alubias blancas (fabes) con compango.', '10,50 €', NULL),
('Espana', 'finde', 'primero', 'Sabado', 'Cocido Madrileño - Sopa', 'Un caldo desgrasado, intenso y reconfortante con fideos finos.', '5,00 €', NULL),
('Espana', 'finde', 'primero', 'Sabado', 'Salmorejo', 'Crema fría de tomates maduros, pan y aceite de oliva, servida con jamón.', '6,00 €', NULL),
('Espana', 'finde', 'primero', 'Sabado', 'Paella', 'Arroz en su punto con el sabor del azafrán y mariscos frescos.', '13,50 €', NULL),
('Espana', 'finde', 'segundo', 'Sabado', 'Secreto Ibérico a la Plancha', 'Corte de cerdo ibérico, a la parrilla para resaltar su jugosidad.', '16,50 €', NULL),
('Espana', 'finde', 'segundo', 'Sabado', 'Cachopo Asturiano', 'Dos filetes de ternera rellenos de jamón y queso, empanados.', '16,50 €', NULL),
('Espana', 'finde', 'segundo', 'Sabado', 'Lubina al Horno', 'Filete de pescado blanco cocinado a baja temperatura.', '15,00 €', NULL),
('Espana', 'finde', 'segundo', 'Sabado', 'Merluza en Salsa Verde', 'Pescado fresco en una emulsión de perejil, ajo y vino blanco.', '15,50 €', NULL),
('Espana', 'finde', 'segundo', 'Sabado', 'Cocido Madrileño - Carne', 'Garbanzos acompañados de carnes, tocino y verduras.', '10,00 €', NULL),
('Espana', 'finde', 'postre', 'Sabado', 'Batido Natural con Leche', 'Elige tu fruta favorita batida con leche.', '4,00 €', NULL),
('Espana', 'finde', 'postre', 'Sabado', 'Macedonia de Frutas', 'Selección de frutas de temporada cortadas a mano.', '4,00 €', NULL),
('Espana', 'finde', 'postre', 'Sabado', 'Cuajada con Miel', 'Postre lácteo suave y fresco, servido con miel artesanal.', '4,00 €', NULL),
('Espana', 'finde', 'postre', 'Sabado', 'Torrijas de Pan Integral', 'Nuestra versión saludable del clásico infusionada en leche.', '4,00 €', NULL),

('Espana', 'finde', 'entrante', 'Domingo', 'Tabla de Ibéricos', 'Selección premium de jamón, lomo y embutidos ibéricos.', '15,50 €', NULL),
('Espana', 'finde', 'entrante', 'Domingo', 'Patatas Bravas', 'Cubos de patata crujientes por fuera y tiernos por dentro, bañados en salsa brava.', '6,50 €', NULL),
('Espana', 'finde', 'entrante', 'Domingo', 'Croquetas de Jamón', 'Bechamel cremosa y trocitos de jamón ibérico, con un empanado dorado.', '5,00 €', NULL),
('Espana', 'finde', 'entrante', 'Domingo', 'Ensaladilla Rusa', 'Nuestra versión clásica con patata, atún de calidad, guisantes y mayonesa.', '5,50 €', NULL),
('Espana', 'finde', 'entrante', 'Domingo', 'Tortilla de Patata', 'Jugosa, hecha al momento con huevos de corral y patatas seleccionadas.', '6,90 €', NULL),
('Espana', 'finde', 'primero', 'Domingo', 'Fabada Asturiana', 'Un guiso contundente de alubias blancas (fabes) con compango.', '10,50 €', NULL),
('Espana', 'finde', 'primero', 'Domingo', 'Cocido Madrileño - Sopa', 'Un caldo desgrasado, intenso y reconfortante con fideos finos.', '5,00 €', NULL),
('Espana', 'finde', 'primero', 'Domingo', 'Salmorejo', 'Crema fría de tomates maduros, pan y aceite de oliva, servida con jamón.', '6,00 €', NULL),
('Espana', 'finde', 'primero', 'Domingo', 'Paella', 'Arroz en su punto con el sabor del azafrán y mariscos frescos.', '13,50 €', NULL),
('Espana', 'finde', 'segundo', 'Domingo', 'Secreto Ibérico a la Plancha', 'Corte de cerdo ibérico, a la parrilla para resaltar su jugosidad.', '16,50 €', NULL),
('Espana', 'finde', 'segundo', 'Domingo', 'Cachopo Asturiano', 'Dos filetes de ternera rellenos de jamón y queso, empanados.', '16,50 €', NULL),
('Espana', 'finde', 'segundo', 'Domingo', 'Lubina al Horno', 'Filete de pescado blanco cocinado a baja temperatura.', '15,00 €', NULL),
('Espana', 'finde', 'segundo', 'Domingo', 'Merluza en Salsa Verde', 'Pescado fresco en una emulsión de perejil, ajo y vino blanco.', '15,50 €', NULL),
('Espana', 'finde', 'segundo', 'Domingo', 'Cocido Madrileño - Carne', 'Garbanzos acompañados de carnes, tocino y verduras.', '10,00 €', NULL),
('Espana', 'finde', 'postre', 'Domingo', 'Batido Natural con Leche', 'Elige tu fruta favorita batida con leche.', '4,00 €', NULL),
('Espana', 'finde', 'postre', 'Domingo', 'Macedonia de Frutas', 'Selección de frutas de temporada cortadas a mano.', '4,00 €', NULL),
('Espana', 'finde', 'postre', 'Domingo', 'Cuajada con Miel', 'Postre lácteo suave y fresco, servido con miel artesanal.', '4,00 €', NULL),
('Espana', 'finde', 'postre', 'Domingo', 'Torrijas de Pan Integral', 'Nuestra versión saludable del clásico infusionada en leche.', '4,00 €', NULL);

-- ==========================================
-- BEBIDAS - TAILANDIA
-- ==========================================
INSERT INTO platos (pais, tipo_menu, categoria, dia_semana, nombre, descripcion, precio, imagen) VALUES
('Tailandia', 'bebida', 'bebida', 'Todos', 'Vino Tinto / Blanco / Rosado (Copa)', 'Copa de vino de la casa.', '3,50 €', NULL),
('Tailandia', 'bebida', 'bebida', 'Todos', 'Jarra de Agua', 'Agua del grifo.', '0,00 €', NULL),
('Tailandia', 'bebida', 'bebida', 'Todos', 'Botella de Agua Aquabona 500ml', 'Botella de agua mineral.', '2,20 €', NULL),
('Tailandia', 'bebida', 'bebida', 'Todos', 'Cerveza Tailandesa (Chang)', 'Cerveza típica importada.', '2,80 €', NULL),
('Tailandia', 'bebida', 'bebida', 'Todos', 'Cerveza Tailandesa (Singha)', 'La original premium.', '2,80 €', NULL),
('Tailandia', 'bebida', 'bebida', 'Todos', 'Refresco', 'Coca-Cola, Fanta, Sprite, Nestea.', '2,70 €', NULL);

-- ==========================================
-- TAILANDIA - MENÚ DEL DÍA (L-V)
-- ==========================================
INSERT INTO platos (pais, tipo_menu, categoria, dia_semana, nombre, descripcion, precio, imagen) VALUES
('Tailandia', 'dia', 'primero', 'Lunes', 'Sopa Tom Kha Gai', 'Sopa muy cremosa y suave de pollo y leche de coco.', NULL, NULL),
('Tailandia', 'dia', 'primero', 'Lunes', 'Ensalada Som Tam', 'Ensalada de papaya verde con aliño de lima y cacahuete.', NULL, NULL),
('Tailandia', 'dia', 'segundo', 'Lunes', 'Gai Pad Med Mamuang', 'Salteado de pollo con anacardos, cebolla y pimientos.', NULL, NULL),
('Tailandia', 'dia', 'segundo', 'Lunes', 'Pla Kapong Neung Manao', 'Lubina fresca cocinada al vapor con mucha lima y ajo.', NULL, NULL),
('Tailandia', 'dia', 'postre', 'Lunes', 'Mango Sticky Rice', 'Arroz dulce pegajoso bañado en leche de coco cremosa y mango.', NULL, NULL),
('Tailandia', 'dia', 'postre', 'Lunes', 'Fruta de Temporada', 'Selección de la mejor fruta fresca del día.', NULL, NULL),

('Tailandia', 'dia', 'primero', 'Martes', 'Sopa Thai', 'Caldo con gambas frescas, champiñones, pak choi y toque de coco.', NULL, NULL),
('Tailandia', 'dia', 'primero', 'Martes', 'Poh Pia con Lechuga', 'Rollitos de primavera artesanos con salsa agridulce.', NULL, NULL),
('Tailandia', 'dia', 'segundo', 'Martes', 'Khao Pad', 'Arroz jazmín salteado al wok con huevo y verduras picadas.', NULL, NULL),
('Tailandia', 'dia', 'segundo', 'Martes', 'Pad Thai de Gambas', 'Tallarines de arroz salteados con gambas, brotes de soja y tamarindo.', NULL, NULL),
('Tailandia', 'dia', 'postre', 'Martes', 'Sakoo', 'Perlas de tapioca en crema de leche de coco dulce y templada.', NULL, NULL),
('Tailandia', 'dia', 'postre', 'Martes', 'Fruta de Temporada', 'Selección de la mejor fruta fresca del día.', NULL, NULL),

('Tailandia', 'dia', 'primero', 'Miercoles', 'Ensalada Larb Gai', 'Ensalada templada de pollo picado y arroz tostado.', NULL, NULL),
('Tailandia', 'dia', 'primero', 'Miercoles', 'Sopa Tom Yum', 'Caldo tailandés picante e intenso con gambas y limoncillo.', NULL, NULL),
('Tailandia', 'dia', 'segundo', 'Miercoles', 'Curry Verde Thai con Pollo', 'Guiso cremoso de pollo en leche de coco y chiles verdes.', NULL, NULL),
('Tailandia', 'dia', 'segundo', 'Miercoles', 'Thai Fish Curry', 'Pescado blanco cocinado a fuego lento en salsa de curry suave.', NULL, NULL),
('Tailandia', 'dia', 'postre', 'Miercoles', 'Helado Casero de Coco', 'Helado artesanal de textura cremosa y sabor auténtico.', NULL, NULL),
('Tailandia', 'dia', 'postre', 'Miercoles', 'Fruta de Temporada', 'Selección de la mejor fruta fresca del día.', NULL, NULL),

('Tailandia', 'dia', 'primero', 'Jueves', 'Ensalada Som Tam de Pepino', 'Variante de la ensalada nacional con pepino crujiente y lima.', NULL, NULL),
('Tailandia', 'dia', 'primero', 'Jueves', 'Sopa Gaeng Jued', 'Caldo claro de verduras de temporada con dados de tofu.', NULL, NULL),
('Tailandia', 'dia', 'segundo', 'Jueves', 'Pad Kra Pao', 'Carne picada salteada al wok con ajo, chiles y albahaca.', NULL, NULL),
('Tailandia', 'dia', 'segundo', 'Jueves', 'Pescado a la Parrilla', 'Filete de pescado a la plancha bañado en salsa de tamarindo.', NULL, NULL),
('Tailandia', 'dia', 'postre', 'Jueves', 'Kluay Buat Chi', 'Plátano maduro pochado en crema caliente de leche de coco.', NULL, NULL),
('Tailandia', 'dia', 'postre', 'Jueves', 'Fruta de Temporada', 'Selección de la mejor fruta fresca del día.', NULL, NULL),

('Tailandia', 'dia', 'primero', 'Viernes', 'Poh Pia Tod Caseros', 'Rollitos vegetales crujientes con fideos de cristal.', NULL, NULL),
('Tailandia', 'dia', 'primero', 'Viernes', 'Sopa Khao Tom', 'Sopa de arroz tailandesa cocinada con jengibre, apio y carne.', NULL, NULL),
('Tailandia', 'dia', 'segundo', 'Viernes', 'Pad Thai Sai de Pollo', 'Tallarines de arroz con pollo y aromas a tamarindo.', NULL, NULL),
('Tailandia', 'dia', 'segundo', 'Viernes', 'Goong Pad Nam Prikpao', 'Gambas salteadas con pasta de chile tostado ahumado.', NULL, NULL),
('Tailandia', 'dia', 'postre', 'Viernes', 'Luk Chup', 'Dulces tradicionales de pasta de judía verde glaseados.', NULL, NULL),
('Tailandia', 'dia', 'postre', 'Viernes', 'Fruta de Temporada', 'Selección de la mejor fruta fresca del día.', NULL, NULL);

-- ==========================================
-- TAILANDIA - MENÚ INFANTIL
-- ==========================================
INSERT INTO platos (pais, tipo_menu, categoria, dia_semana, nombre, descripcion, precio, imagen) VALUES
('Tailandia', 'infantil', 'infantil', 'Todos', 'Brochetas Satay con Brócoli', 'Brochetas de pollo marinadas en leche de coco con brócoli al vapor.', NULL, NULL),
('Tailandia', 'infantil', 'infantil', 'Todos', 'Sopa Tom Yum sin picante', 'Un caldo aromático, suave y sin rastro de picante.', NULL, NULL),
('Tailandia', 'infantil', 'infantil', 'Todos', 'Rollitos y Palitos de Zanahoria', 'Rollitos vegetales crujientes con bastoncitos de zanahoria fresca.', NULL, NULL),
('Tailandia', 'infantil', 'infantil', 'Todos', 'Pollo Sweet Chili', 'Dados de pollo salteados en salsa dulce (no pica) con patata cocida.', NULL, NULL),
('Tailandia', 'infantil', 'infantil', 'Todos', 'Pad Thai Junior', 'Tallarines de arroz salteados con pollo y huevo, sin frutos secos.', NULL, NULL),
('Tailandia', 'infantil', 'infantil', 'Todos', 'Bocaditos de Pescado Andamán', 'Filetes de pescado blanco crujientes por fuera y tiernos por dentro.', NULL, NULL),
('Tailandia', 'infantil', 'infantil', 'Todos', 'Helado de Coco o Vainilla', 'Helado artesanal elaborado con ingredientes naturales.', NULL, NULL),
('Tailandia', 'infantil', 'infantil', 'Todos', 'Brocheta de Fruta Tropical', 'Piña, mango y plátano a elegir, con o sin sirope de chocolate.', NULL, NULL);

-- ==========================================
-- TAILANDIA - MENÚ FIN DE SEMANA
-- ==========================================
INSERT INTO platos (pais, tipo_menu, categoria, dia_semana, nombre, descripcion, precio, imagen) VALUES
('Tailandia', 'finde', 'entrante', 'Sabado', 'Surtido de Brochetas Satay', 'Brochetas de pollo marinadas servidas con la clásica salsa de cacahuetes.', '8,50 €', NULL),
('Tailandia', 'finde', 'entrante', 'Sabado', 'Poh Pia Tod Caseros', 'Rollitos vegetales hechos a mano con fideos de cristal y salsa agridulce.', '8,50 €', NULL),
('Tailandia', 'finde', 'entrante', 'Sabado', 'Ensalada Som Tam', 'Fresca y vibrante con lima, cacahuetes y un toque picante.', '5,00 €', NULL),
('Tailandia', 'finde', 'entrante', 'Sabado', 'Tod Mun Goong', 'Tortitas de gambas empanadas en panko típicas de Bangkok.', '6,90 €', NULL),
('Tailandia', 'finde', 'primero', 'Sabado', 'Sopa Tom Kha Gai', 'Sopa cremosa de coco, pollo y galanga, ideal para quienes buscan algo suave.', '10,50 €', NULL),
('Tailandia', 'finde', 'segundo', 'Sabado', 'Sopa Tom Yum Goong', 'La versión picante y ácida con gambas, perfecta para sabores intensos.', '10,00 €', NULL),
('Tailandia', 'finde', 'segundo', 'Sabado', 'Yum Talay', 'Ensalada templada de calamares y langostinos con aliño de limoncillo.', '14,50 €', NULL),
('Tailandia', 'finde', 'segundo', 'Sabado', 'Pad Thai de la Casa', 'Tallarines de arroz salteados con gambas o pollo, huevo, brotes y cacahuetes.', '13,50 €', NULL),
('Tailandia', 'finde', 'segundo', 'Sabado', 'Curry Verde con Ternera', 'Guiso aromático con leche de coco, albahaca tailandesa y berenjenas.', '14,50 €', NULL),
('Tailandia', 'finde', 'segundo', 'Sabado', 'Pla Kapong Neung Manao', 'Lubina fresca cocinada con mucha lima, ajo y chiles.', '15,00 €', NULL),
('Tailandia', 'finde', 'segundo', 'Sabado', 'Pad Kra Pao', 'Carne picada salteada con albahaca sagrada y chile, con huevo frito encima.', '13,50 €', NULL),
('Tailandia', 'finde', 'postre', 'Sabado', 'Mango Sticky Rice', 'Arroz dulce con leche de coco y mango fresco.', '5,50 €', NULL),
('Tailandia', 'finde', 'postre', 'Sabado', 'Kluay Buat Chi', 'Plátano pochado en crema caliente de coco.', '5,50 €', NULL),
('Tailandia', 'finde', 'postre', 'Sabado', 'Macedonia de Frutas', 'Selección de frutas de temporada cortadas a mano.', '4,50 €', NULL),
('Tailandia', 'finde', 'postre', 'Sabado', 'Helado Casero', 'Helado de Té Verde o Coco casero a elegir.', '4,00 €', NULL),

('Tailandia', 'finde', 'entrante', 'Domingo', 'Surtido de Brochetas Satay', 'Brochetas de pollo marinadas servidas con la clásica salsa de cacahuetes.', '8,50 €', NULL),
('Tailandia', 'finde', 'entrante', 'Domingo', 'Poh Pia Tod Caseros', 'Rollitos vegetales hechos a mano con fideos de cristal y salsa agridulce.', '8,50 €', NULL),
('Tailandia', 'finde', 'entrante', 'Domingo', 'Ensalada Som Tam', 'Fresca y vibrante con lima, cacahuetes y un toque picante.', '5,00 €', NULL),
('Tailandia', 'finde', 'entrante', 'Domingo', 'Tod Mun Goong', 'Tortitas de gambas empanadas en panko típicas de Bangkok.', '6,90 €', NULL),
('Tailandia', 'finde', 'primero', 'Domingo', 'Sopa Tom Kha Gai', 'Sopa cremosa de coco, pollo y galanga, ideal para quienes buscan algo suave.', '10,50 €', NULL),
('Tailandia', 'finde', 'segundo', 'Domingo', 'Sopa Tom Yum Goong', 'La versión picante y ácida con gambas, perfecta para sabores intensos.', '10,00 €', NULL),
('Tailandia', 'finde', 'segundo', 'Domingo', 'Yum Talay', 'Ensalada templada de calamares y langostinos con aliño de limoncillo.', '14,50 €', NULL),
('Tailandia', 'finde', 'segundo', 'Domingo', 'Pad Thai de la Casa', 'Tallarines de arroz salteados con gambas o pollo, huevo, brotes y cacahuetes.', '13,50 €', NULL),
('Tailandia', 'finde', 'segundo', 'Domingo', 'Curry Verde con Ternera', 'Guiso aromático con leche de coco, albahaca tailandesa y berenjenas.', '14,50 €', NULL),
('Tailandia', 'finde', 'segundo', 'Domingo', 'Pla Kapong Neung Manao', 'Lubina fresca cocinada con mucha lima, ajo y chiles.', '15,00 €', NULL),
('Tailandia', 'finde', 'segundo', 'Domingo', 'Pad Kra Pao', 'Carne picada salteada con albahaca sagrada y chile, con huevo frito encima.', '13,50 €', NULL),
('Tailandia', 'finde', 'postre', 'Domingo', 'Mango Sticky Rice', 'Arroz dulce con leche de coco y mango fresco.', '5,50 €', NULL),
('Tailandia', 'finde', 'postre', 'Domingo', 'Kluay Buat Chi', 'Plátano pochado en crema caliente de coco.', '5,50 €', NULL),
('Tailandia', 'finde', 'postre', 'Domingo', 'Macedonia de Frutas', 'Selección de frutas de temporada cortadas a mano.', '4,50 €', NULL),
('Tailandia', 'finde', 'postre', 'Domingo', 'Helado Casero', 'Helado de Té Verde o Coco casero a elegir.', '4,00 €', NULL);

-- ==========================================
-- BEBIDAS - CHILE
-- ==========================================
INSERT INTO platos (pais, tipo_menu, categoria, dia_semana, nombre, descripcion, precio, imagen) VALUES
('Chile', 'bebida', 'bebida', 'Todos', 'Vino Tinto / Blanco / Rosado (Copa)', 'Copa de vino de la casa.', '3,50 €', NULL),
('Chile', 'bebida', 'bebida', 'Todos', 'Jarra de Agua', 'Agua del grifo.', '0,00 €', NULL),
('Chile', 'bebida', 'bebida', 'Todos', 'Botella de Agua Aquabona 500ml', 'Botella de agua mineral.', '2,20 €', NULL),
('Chile', 'bebida', 'bebida', 'Todos', 'Pisco Sour Tradicional', 'Cóctel emblemático.', '3,80 €', NULL),
('Chile', 'bebida', 'bebida', 'Todos', 'Refresco', 'Coca-Cola, Fanta, Sprite, Nestea.', '2,70 €', NULL);

-- ==========================================
-- CHILE - MENÚ DEL DÍA (L-V)
-- ==========================================
INSERT INTO platos (pais, tipo_menu, categoria, dia_semana, nombre, descripcion, precio, imagen) VALUES
('Chile', 'dia', 'primero', 'Lunes', 'Ensalada Chilena', 'Fresca ensalada de tomate pelado, cebolla cortada fina, cilantro y aliño tradicional.', NULL, NULL),
('Chile', 'dia', 'primero', 'Lunes', 'Caldillo de Congrio', 'Guiso reconfortante de pescado con papas y verduras, servido en cuenco.', NULL, NULL),
('Chile', 'dia', 'segundo', 'Lunes', 'Pastel de Choclo', 'Capa de pino de carne bajo una crema de maíz dulce gratinada.', NULL, NULL),
('Chile', 'dia', 'segundo', 'Lunes', 'Reineta a la Plancha', 'Pescado fresco a la plancha servido con papas cocidas.', NULL, NULL),
('Chile', 'dia', 'postre', 'Lunes', 'Leche Asada', 'Postre lácteo al horno con caramelo y un toque de vainilla.', NULL, NULL),
('Chile', 'dia', 'postre', 'Lunes', 'Fruta de Temporada', 'Selección de la mejor fruta fresca del día.', NULL, NULL),

('Chile', 'dia', 'primero', 'Martes', 'Porotos con Riendas', 'Plato contundente de alubias blancas con tallarines, zapallo y trozos de longaniza.', NULL, NULL),
('Chile', 'dia', 'primero', 'Martes', 'Sopa de Verduras Chilena', 'Sopa ligera con verduras frescas de temporada.', NULL, NULL),
('Chile', 'dia', 'segundo', 'Martes', 'Charquicán con Huevo', 'Guiso tradicional de zapallo, papas y carne desmenuzada coronado con un huevo frito.', NULL, NULL),
('Chile', 'dia', 'segundo', 'Martes', 'Merluza Austral al Horno', 'Merluza patagónica jugosa horneada con finas hierbas.', NULL, NULL),
('Chile', 'dia', 'postre', 'Martes', 'Mote con Huesillo', 'Bebida dulce refrescante con trigo mote cocido y duraznos deshidratados.', NULL, NULL),
('Chile', 'dia', 'postre', 'Martes', 'Fruta de Temporada', 'Selección de la mejor fruta fresca del día.', NULL, NULL),

('Chile', 'dia', 'primero', 'Miercoles', 'Crema de Zapallo', 'Suave y dulce crema de calabaza asada.', NULL, NULL),
('Chile', 'dia', 'primero', 'Miercoles', 'Ensalada de Cochayuyo', 'Alga nutritiva preparada con cebolla, cilantro y un toque de limón.', NULL, NULL),
('Chile', 'dia', 'segundo', 'Miercoles', 'Salmón al Merkén con Verduras', 'Filete de salmón sazonado con ají ahumado y guarnición de temporada.', NULL, NULL),
('Chile', 'dia', 'segundo', 'Miercoles', 'Cazuela de Vacuno', 'Caldo tradicional con carne de res, maíz, zapallo y papas.', NULL, NULL),
('Chile', 'dia', 'postre', 'Miercoles', 'Kuchen de Manzana', 'Tarta clásica del sur con manzanas frescas y canela.', NULL, NULL),
('Chile', 'dia', 'postre', 'Miercoles', 'Fruta de Temporada', 'Selección de la mejor fruta fresca del día.', NULL, NULL),

('Chile', 'dia', 'primero', 'Jueves', 'Humitas', 'Masa de maíz tierno (choclo) envuelta en su propia hoja y cocida al vapor.', NULL, NULL),
('Chile', 'dia', 'primero', 'Jueves', 'Ensalada de Porotos Verdes', 'Refrescante ensalada de judías verdes aliñadas.', NULL, NULL),
('Chile', 'dia', 'segundo', 'Jueves', 'Pollo Arvejado', 'Clásico guiso de pollo cocinado a fuego lento con arvejas y zanahorias.', NULL, NULL),
('Chile', 'dia', 'segundo', 'Jueves', 'Paila Marina', 'Un intenso concentrado de mariscos y pescados frescos del Pacífico.', NULL, NULL),
('Chile', 'dia', 'postre', 'Jueves', 'Suspiro Limeño', 'Postre cremoso de manjar blanco coronado con merengue al Oporto.', NULL, NULL),
('Chile', 'dia', 'postre', 'Jueves', 'Fruta de Temporada', 'Selección de la mejor fruta fresca del día.', NULL, NULL),

('Chile', 'dia', 'primero', 'Viernes', 'Sopaipillas al Horno con Pebre', 'Masas tradicionales de zapallo servidas con picadillo de tomate, cebolla y ají verde.', NULL, NULL),
('Chile', 'dia', 'primero', 'Viernes', 'Consomé de Ave', 'Caldo caliente y reparador de pollo con verduras finas.', NULL, NULL),
('Chile', 'dia', 'segundo', 'Viernes', 'Lomo a lo Pobre', 'Corte de vacuno a la plancha con papas fritas, cebolla y huevo frito.', NULL, NULL),
('Chile', 'dia', 'segundo', 'Viernes', 'Congrio Frito con Ensalada', 'Medallón de congrio frito en batido crujiente con ensalada chilena.', NULL, NULL),
('Chile', 'dia', 'postre', 'Viernes', 'Brazo de Reina', 'Bizcocho enrollado esponjoso y relleno de abundante manjar artesanal.', NULL, NULL),
('Chile', 'dia', 'postre', 'Viernes', 'Fruta de Temporada', 'Selección de la mejor fruta fresca del día.', NULL, NULL);

-- ==========================================
-- CHILE - MENÚ INFANTIL
-- ==========================================
INSERT INTO platos (pais, tipo_menu, categoria, dia_semana, nombre, descripcion, precio, imagen) VALUES
('Chile', 'infantil', 'infantil', 'Todos', 'Crema de Zapallo', 'Crema suave y dulce de calabaza.', NULL, NULL),
('Chile', 'infantil', 'infantil', 'Todos', 'Arroz con Verduras', 'Arroz salteado con verduras picadas finamente.', NULL, NULL),
('Chile', 'infantil', 'infantil', 'Todos', 'Sopa de Ave con Fideos', 'Caldo de pollo reconfortante con fideos finos.', NULL, NULL),
('Chile', 'infantil', 'infantil', 'Todos', 'Pastel de Choclo', 'Rica crema de maíz dulce al horno con carne.', NULL, NULL),
('Chile', 'infantil', 'infantil', 'Todos', 'Merluza al Horno con Puré', 'Pescado blanco suave acompañado de puré de patatas cremoso.', NULL, NULL),
('Chile', 'infantil', 'infantil', 'Todos', 'Pollo Arvejado con Arroz', 'Guiso de pollo tierno con guisantes y arroz.', NULL, NULL),
('Chile', 'infantil', 'infantil', 'Todos', 'Leche Asada', 'Postre lácteo tradicional al horno con caramelo.', NULL, NULL),
('Chile', 'infantil', 'infantil', 'Todos', 'Fruta de Temporada', 'Pieza de fruta del día.', NULL, NULL);

-- ==========================================
-- CHILE - MENÚ FIN DE SEMANA
-- ==========================================
INSERT INTO platos (pais, tipo_menu, categoria, dia_semana, nombre, descripcion, precio, imagen) VALUES
('Chile', 'finde', 'entrante', 'Sabado', 'Sopaipillas al Horno con Pebre', 'Masas tradicionales de zapallo servidas con un picadillo de tomate, cebolla y ají verde.', '6,50 €', NULL),
('Chile', 'finde', 'entrante', 'Sabado', 'Empanaditas de Pino o Queso', 'Selección artesanal horneada, rellenas de carne picada o queso fundido.', '7,50 €', NULL),
('Chile', 'finde', 'entrante', 'Sabado', 'Ensalada de Cochayuyo', 'Alga nutritiva preparada con cebolla, cilantro y un toque de limón.', '8,00 €', NULL),
('Chile', 'finde', 'entrante', 'Sabado', 'Crudo Valdiviano', 'Carne de vacuno finamente picada con aliños típicos sobre tostadas.', '12,50 €', NULL),
('Chile', 'finde', 'entrante', 'Sabado', 'Palta Reina Chilena', 'Media palta rellena de suave mezcla de pollo desmechado, mayonesa artesanal y pimientos, sobre lechuga.', '9,90 €', NULL),
('Chile', 'finde', 'primero', 'Sabado', 'Caldillo de Congrio', 'Guiso reconfortante de pescado con papas y verduras, servido en cuenco.', '10,50 €', NULL),
('Chile', 'finde', 'primero', 'Sabado', 'Porotos con Riendas', 'Alubias blancas con tallarines, zapallo y trozos de longaniza.', '9,00 €', NULL),
('Chile', 'finde', 'primero', 'Sabado', 'Paila Marina', 'Un intenso concentrado de mariscos y pescados frescos del Pacífico.', '10,00 €', NULL),
('Chile', 'finde', 'primero', 'Sabado', 'Cazuela de Vacuno', 'Caldo tradicional con carne de res, maíz, zapallo y papas.', '9,00 €', NULL),
('Chile', 'finde', 'primero', 'Sabado', 'Humitas', 'Masa de maíz tierno (choclo) envuelta en su propia hoja y cocida al vapor.', '11,50 €', NULL),
('Chile', 'finde', 'segundo', 'Sabado', 'Pastel de Choclo', 'Capa de pino de carne bajo una crema de maíz dulce gratinada.', '16,50 €', NULL),
('Chile', 'finde', 'segundo', 'Sabado', 'Lomo a lo Pobre', 'Corte de vacuno a la plancha con papas fritas, cebolla y huevo frito.', '16,50 €', NULL),
('Chile', 'finde', 'segundo', 'Sabado', 'Salmón al Merkén con Verduras', 'Filete de salmón sazonado con ají ahumado y guarnición de temporada.', '15,00 €', NULL),
('Chile', 'finde', 'segundo', 'Sabado', 'Charquicán con Huevo', 'Guiso de zapallo, papas y carne desmenuzada coronado con huevo.', '14,50 €', NULL),
('Chile', 'finde', 'postre', 'Sabado', 'Leche Asada', 'Postre lácteo al horno con caramelo y un toque de vainilla.', '4,50 €', NULL),
('Chile', 'finde', 'postre', 'Sabado', 'Kuchen de Manzana', 'Tarta clásica con manzanas frescas y canela.', '5,50 €', NULL),
('Chile', 'finde', 'postre', 'Sabado', 'Chocotorta', 'Capas de galletas de chocolate en café, intercaladas con manjar y queso crema.', '5,50 €', NULL),
('Chile', 'finde', 'postre', 'Sabado', 'Brazo de Reina', 'Bizcocho enrollado relleno de manjar artesanal.', '4,00 €', NULL),
('Chile', 'finde', 'postre', 'Sabado', 'Macedonia de Fruta de Temporada', 'Selección de frutas naturales de temporada.', '4,00 €', NULL),

-- Domingo Chile
('Chile', 'finde', 'entrante', 'Domingo', 'Sopaipillas al Horno con Pebre', 'Masas tradicionales de zapallo servidas con un picadillo de tomate, cebolla y ají verde.', '6,50 €', NULL),
('Chile', 'finde', 'entrante', 'Domingo', 'Empanaditas de Pino o Queso', 'Selección artesanal horneada, rellenas de carne picada o queso fundido.', '7,50 €', NULL),
('Chile', 'finde', 'entrante', 'Domingo', 'Ensalada de Cochayuyo', 'Alga nutritiva preparada con cebolla, cilantro y un toque de limón.', '8,00 €', NULL),
('Chile', 'finde', 'entrante', 'Domingo', 'Crudo Valdiviano', 'Carne de vacuno finamente picada con aliños típicos sobre tostadas.', '12,50 €', NULL),
('Chile', 'finde', 'entrante', 'Domingo', 'Palta Reina Chilena', 'Media palta rellena de suave mezcla de pollo desmechado, mayonesa artesanal y pimientos, sobre lechuga.', '9,90 €', NULL),
('Chile', 'finde', 'primero', 'Domingo', 'Caldillo de Congrio', 'Guiso reconfortante de pescado con papas y verduras, servido en cuenco.', '10,50 €', NULL),
('Chile', 'finde', 'primero', 'Domingo', 'Porotos con Riendas', 'Alubias blancas con tallarines, zapallo y trozos de longaniza.', '9,00 €', NULL),
('Chile', 'finde', 'primero', 'Domingo', 'Paila Marina', 'Un intenso concentrado de mariscos y pescados frescos del Pacífico.', '10,00 €', NULL),
('Chile', 'finde', 'primero', 'Domingo', 'Cazuela de Vacuno', 'Caldo tradicional con carne de res, maíz, zapallo y papas.', '9,00 €', NULL),
('Chile', 'finde', 'primero', 'Domingo', 'Humitas', 'Masa de maíz tierno (choclo) envuelta en su propia hoja y cocida al vapor.', '11,50 €', NULL),
('Chile', 'finde', 'segundo', 'Domingo', 'Pastel de Choclo', 'Capa de pino de carne bajo una crema de maíz dulce gratinada.', '16,50 €', NULL),
('Chile', 'finde', 'segundo', 'Domingo', 'Lomo a lo Pobre', 'Corte de vacuno a la plancha con papas fritas, cebolla y huevo frito.', '16,50 €', NULL),
('Chile', 'finde', 'segundo', 'Domingo', 'Salmón al Merkén con Verduras', 'Filete de salmón sazonado con ají ahumado y guarnición de temporada.', '15,00 €', NULL),
('Chile', 'finde', 'segundo', 'Domingo', 'Charquicán con Huevo', 'Guiso de zapallo, papas y carne desmenuzada coronado con huevo.', '14,50 €', NULL),
('Chile', 'finde', 'postre', 'Domingo', 'Leche Asada', 'Postre lácteo al horno con caramelo y un toque de vainilla.', '4,50 €', NULL),
('Chile', 'finde', 'postre', 'Domingo', 'Kuchen de Manzana', 'Tarta clásica con manzanas frescas y canela.', '5,50 €', NULL),
('Chile', 'finde', 'postre', 'Domingo', 'Chocotorta', 'Capas de galletas de chocolate en café, intercaladas con manjar y queso crema.', '5,50 €', NULL),
('Chile', 'finde', 'postre', 'Domingo', 'Brazo de Reina', 'Bizcocho enrollado relleno de manjar artesanal.', '4,00 €', NULL),
('Chile', 'finde', 'postre', 'Domingo', 'Macedonia de Fruta de Temporada', 'Selección de frutas naturales de temporada.', '4,00 €', NULL);

INSERT INTO usuarios (nombre, email, password, rol) 
VALUES ('Jefe Sabores', 'admin@saboresdelmundo.com', 'admin123', 'ADMIN');