CREATE TABLE "users" (
  "id" serial PRIMARY KEY,
  "name" varchar NOT NULL,
  "email" varchar UNIQUE NOT NULL,
  "password" varchar NOT NULL,
  "created_at" timestamp DEFAULT 'now()',
  "update_at" timestamp DEFAULT 'now()'
);

CREATE TABLE "products" (
  "id" serial PRIMARY KEY,
  "name" varchar NOT NULL,
  "description" text NOT NULL,
  "price" money NOT NULL,
  "category_id" int NOT NULL,
  "created_at" timestamp DEFAULT 'now()',
  "update_at" timestamp DEFAULT 'now()'
);

CREATE TABLE "cart" (
  "id" serial PRIMARY KEY,
  "user_id" int NOT NULL,
  "product_id" int NOT NULL,
  "quantity" int NOT NULL
);

CREATE TABLE "categories" (
  "id" serial PRIMARY KEY,
  "name" varchar NOT NULL
);

CREATE TABLE "products_categories" (
  "id" serial PRIMARY KEY,
  "category_id" int NOT NULL,
  "product_id" int NOT NULL
);

CREATE TABLE "orders" (
  "id" serial PRIMARY KEY,
  "user_id" int NOT NULL,
  "cart_id" int NOT NULL
);

ALTER TABLE "orders" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "cart" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "cart" ADD FOREIGN KEY ("product_id") REFERENCES "products" ("id");

ALTER TABLE "orders" ADD FOREIGN KEY ("cart_id") REFERENCES "cart" ("id");

ALTER TABLE "products_categories" ADD FOREIGN KEY ("category_id") REFERENCES "categories" ("id");

ALTER TABLE "products_categories" ADD FOREIGN KEY ("product_id") REFERENCES "products" ("id");
