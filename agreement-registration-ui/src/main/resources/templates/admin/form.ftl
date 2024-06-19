<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Create Agreement</title>
<#--    <link rel="stylesheet" href="path/to/your/css/styles.css">-->
</head>
<body>
<h1>Create Agreement</h1>
<form action="/admin/agreements" method="post" enctype="multipart/form-data">
    <div>
        <label for="basis">Basis:</label>
        <input type="text" id="basis" name="basis">
    </div>

    <div>
        <label for="practiceType">Practice Type:</label>
        <input type="text" id="practiceType" name="practiceType">
    </div>

    <div>
        <label for="agreementDate">Agreement Date:</label>
        <input type="date" id="agreementDate" name="agreementDate">
    </div>

    <div>
        <label for="startDate">Start Date:</label>
        <input type="date" id="startDate" name="startDate">
    </div>

    <div>
        <label for="endDate">End Date:</label>
        <input type="date" id="endDate" name="endDate">
    </div>

    <div>
        <label for="studentInitials">Student Initials:</label>
        <input type="text" id="studentInitials" name="studentInitials">
    </div>

    <div>
        <label for="year">Year:</label>
        <input type="number" id="year" name="year">
    </div>

    <div>
        <label for="speciality">Speciality:</label>
        <input type="text" id="speciality" name="speciality">
    </div>

    <div>
        <label for="file">Document:</label>
        <input type="file" id="file" name="file" required>
    </div>

    <div>
        <button type="submit">Submit</button>
    </div>
</form>
</body>
</html>
