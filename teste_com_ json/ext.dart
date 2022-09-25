Map<String, dynamic> data = {
  "print": () {
    print("este é um exemplo");
  },
  "async": (String txt) async {
    await Future.delayed(
        const Duration(seconds: 3), () => print("txt: $txt"));
    print("------------- fim.");
  }
};