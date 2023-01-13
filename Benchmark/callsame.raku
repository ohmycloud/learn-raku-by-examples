class Parent {
    method m() { 1 }
}
class Child is Parent {
    method m() { 1 + callsame }
}
for ^10_000_000 {
    Child.m;
}