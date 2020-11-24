module assertFalse(value, message = "Test assertion did not pass(should return false)") {
    assert(value == false, message);
}
module assertTrue(value, message = "Test assertion did not pass(should return true)") {
    assert(value == true, message);
}
