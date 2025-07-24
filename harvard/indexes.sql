CREATE INDEX "enrollment_student"
ON "enrollments"("student_id","course_id");

CREATE INDEX "course_department"
ON "courses"("department");

CREATE INDEX "course_title"
ON "courses"("title");

CREATE INDEX "requirement_name"
ON "requirements"("name");
