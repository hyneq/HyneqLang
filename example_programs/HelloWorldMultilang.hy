hello_string_cs = "Ahoj svete.";
hello_string_en = "Hello world.";
hello_string_de = "Hallo Welt.";


fun print_hello(lang) {
    if (lang == "cs") {
        print(hello_string_cs);
    } elif (lang == "en") {
        print(hello_string_en);
    } elif (lang == "de") {
        print(hello_string_de);
    } else {
        return hello_cycle();
    }
}

fun get_lang(i) {
    if (i == 0) {
        return "cs";
    } elif (i == 1) {
        return "en";
    } elif (i == 2) {
        return "de";
    } else {
        return "none";
    }
}

fun hello_cycle() {
    while (i >= 5) {
        lang = get_lang(i);
        print_hello(lang);
    }
}

print_hello("cs");
print_hello("en");
print_hello("de");
print_hello("all");
