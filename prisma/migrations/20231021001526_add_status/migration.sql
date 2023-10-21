-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_guests" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT ''
);
INSERT INTO "new_guests" ("code", "id", "name") SELECT "code", "id", "name" FROM "guests";
DROP TABLE "guests";
ALTER TABLE "new_guests" RENAME TO "guests";
CREATE UNIQUE INDEX "guests_id_key" ON "guests"("id");
CREATE UNIQUE INDEX "guests_code_key" ON "guests"("code");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
