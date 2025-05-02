/**************************************
* Exemplos_Swift
*
*  Created by Silvano Maneck Malfatti on 01/03/25.
******************************************************/

//Foundation package
import Foundation

//Saída de dados
print("Sejam bem vindos!")

//********** CÓDIGO 1 - DECLARAÇÃO IMPLÍCITA E EXPLÍCITA DE VARIÁVEIS **********
var count = 0
let PI = 3.14
var name = "Swift"
var isOpen = true

//Declaração explícita
var version: Double = 5.7
var floor: Int = 6
let MAX: Int = 100
var country: String = "Brazil"
var isValid: Bool = false
var letter: Character = "X"

//Concatenando variáveis e Strings
print("\(name.uppercased()) é uma linguagem atualmente na versão \(version)")

//Dica! Tipos primitivos e seus metodos!
print(5.description)

//********** CÓDIGO 2 - TUPLAS **********
var car = ("Ferrari", 2015)
var explicitCar: (String, Int) = ("BMW", 2023)
var labelCar = (name: "BMW", year: 2023)
var explicitLabelCar: (name: String, year: Int) = (name: "BMW", year: 2023)
print("Carro: \(car.0) ano: \(car.1)")
print("Carro: \(labelCar.name) ano: \(labelCar.year)")

//**********CÓDIGO 3 - ARRAYS E LISTAS **********
var numbers: [Int] = [1, 2, 3]
var empty: [String] = []
var cars = [String]()
numbers.append(4)
numbers.remove(at: 0)

for number in numbers {
    print(number)
}

let frutas: [String] = ["Maçã", "Banana", "Laranja"]
// frutas.append("Uva") // Erro!

//********** CÓDIGO 4 - DICIONÁRIOS **********
var dictCars: [String: Int] = ["BMW": 2023, "Audi": 2022]
var emptyDict: [String: String] = [:]
var anotherEmptyDict = [String: String]()
print(dictCars["BMW"] ?? 0)
dictCars["Mercedes"] = 2024

//Iteração por dicionarios
for (brand, year) in dictCars {
    print("\(brand) - \(year)")
}

for brand in dictCars.keys {
    print(brand)
}

for year in dictCars.values {
    print(year)
}

//********** CÓDIGOS 5 E 6 - CONJUNTOS **********
var setNumbers: Set = [1, 2, 3, 4, 5]
var emptySet = Set<String>()
let set1: Set = [1, 2, 3]
let set2: Set = [3, 4, 5]

let union = set1.union(set2)
print(union)

let intersection = set1.intersection(set2)
print(intersection)

let diference = set1.subtracting(set2)
print(diference)

struct Car: Hashable {
    let name: String
    let year: Int
}

let setA: Set<Car> = [
    Car(name: "BMW", year: 2020),
    Car(name: "Audi", year: 2021),
    Car(name: "Mercedes", year: 2022),
    Car(name: "Toyota", year: 2023),
    Car(name: "Honda", year: 2024)
]

let setB: Set<Car> = [
    Car(name: "Audi", year: 2021),
    Car(name: "Mercedes", year: 2022),
    Car(name: "Ford", year: 2023),
    Car(name: "Chevrolet", year: 2024),
    Car(name: "Tesla", year: 2025)
]

let intersec = setA.intersection(setB)
print("Interseção:", intersec)

class ClassCar: Hashable {
    let name: String
    let year: Int

    //Construtor ou inicializador da classe
    init(name: String, year: Int) {
        self.name = name
        self.year = year
    }

    // Implementação de `Hashable` left hand side, right hand side
    static func == (lhs: ClassCar, rhs: ClassCar) -> Bool {
        return lhs.name == rhs.name && lhs.year == rhs.year
    }

    //Inout permite alterar a referencia de um objeto dentro da função
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(year)
    }
}

let car1 = ClassCar(name: "BMW", year: 2020)
let car2 = ClassCar(name: "Audi", year: 2021)
let car3 = ClassCar(name: "Mercedes", year: 2022)
let car4 = ClassCar(name: "Toyota", year: 2023)
let car5 = ClassCar(name: "Honda", year: 2024)
let car6 = ClassCar(name: "Audi", year: 2021)
let car7 = ClassCar(name: "Mercedes", year: 2022)
let car8 = ClassCar(name: "Ford", year: 2023)
let car9 = ClassCar(name: "Chevrolet", year: 2024)
let car10 = ClassCar(name: "Tesla", year: 2025)

let setCarA: Set<ClassCar> = [car1, car2, car3, car4, car5]
let setCarB: Set<ClassCar> = [car6, car7, car8, car9, car10]

let intersectCars = setCarA.intersection(setCarB)
print("Interseção:", intersectCars)

if (car3 == car7) {
    print("iguais")
} else if (car1 != car1) {
    print("diferentes")
}

if (car3 === car7) {
    print("iguais")
} else if (car3 !== car7) {
    print("diferentes")
}

//********** CÓDIGO 7 - VARIÁVEIS DO TIPO FUNÇÃO **********
func sum(val1: Int, val2: Int) -> Int {
    return val1 + val2
}

func dif(val1: Int, val2: Int) -> Int {
    return val1 - val2
}

func mul(val1: Int, val2: Int) -> Int {
    return val1 * val2
}

func div(val1: Int, val2: Int) -> Int {
    return val1 / val2
}

var operation: (Int, Int) -> Int = sum
operation = dif
operation = mul
operation = div

var closure:(Int,Int) -> Int = { $0 + $1 }

func execOperation(val1: Int, val2: Int, operation: (Int, Int)->Int) -> Int {
    return operation(val1, val2)
}

var result = execOperation(val1: 10 ,val2: 10, operation: sum)
print(result)

result = execOperation(val1: 10 ,val2: 10, operation: mul)
print(result)

result = execOperation(val1: 10 ,val2: 10, operation: dif)
print(result)

result = execOperation(val1: 10 , val2: 10, operation: div)
print(result)

result = execOperation(val1: 10 , val2: 10, operation: closure)
print(result)

let ordered = frutas.sorted { $0 < $1 }
print(ordered)

//********** CÓDIGO 8 - VARIÁVEIS DO TIPO OPCIONAL **********
var text: String = "Swift"
//text = nil Erro!

var optional: String? = "Swift"
optional = nil

var secureOptional: String! =  "Secure Swift"

//Não irá quebrar a aplicação
print(optional?.uppercased())

//Realizando o Unwrapping com ??
print(optional ?? String())

//Realizando o Unwrapping com if let
if let secureText = optional {
    print(secureText)
}

printOptional(optionalText: optional)
func printOptional(optionalText: String?) {
    //Realizando o Unwrapping com guard let
    guard let secureText = optionalText else {
        return
    }
    print(secureText)
    print(optionalText!)
}

//********** CÓDIGOS 9 E 10 - FUNÇÕES EM SWIFT **********
func printSomething() {
    print("Hello World")
}
printSomething()

func showUserData(name: String, age: Int) {
    print("Me chamo \(name) e tenho \(age) anos.")
}
showUserData(name: "Swift", age: 11)

func pi() -> Double {
    return 3.1415
}
print(pi())

func classifyNumber(number: Int) -> (String, String) {
    let evenOrOdd = (number % 2 == 0) ? "Par" : "Impar"
    let positiveOrNegative = (number > 0) ? "Positivo" : (number < 0) ? "Negativo" : "Zero"
    return (evenOrOdd, positiveOrNegative)
}
print(classifyNumber(number: 9))
print(classifyNumber(number: -2))

func noLabelsFunc(_ name: String) {
    print(name)
}
noLabelsFunc("Swift")

func noLabelsFuncDefault(_ name: String = "Default") {
    print(name)
}
noLabelsFuncDefault("Swift")
noLabelsFuncDefault()

func funcDefaultWith(with name: String = "Default") {
    print(name)
}
funcDefaultWith(with: "Swift")
funcDefaultWith()

func variadicFunc(varArgs: String...) {
    print(varArgs.sorted(by: { $0 < $1}))
}
variadicFunc(varArgs: "Swift", "Java", "C#", "Python", "C++", "Dart", "Kotlin")

func swap(val1: inout Int, val2: inout Int) {
    var aux = val1
    val1 = val2
    val2 = aux
}
var num1 = 10
var num2 = 50
swap(val1: &num1, val2: &num2)
print(num1)
print(num2)

//********** CÓDIGO 11  - CLASSES E OBJETOS **********

class ObejctCar {
    //Stored properties
    var brand: String
    var year: Int
   
    //Computed properties
    var IPVA: Double {
        return 0.5 * Double(year)
    }
    
    private var _kms: Int
    var kms: Int {
        get {
            return _kms
        }
        set(newKms) {
            if newKms >= 0 {
                _kms = newKms
            } else {
                print("Erro:O valor não pode ser negativo.")
            }
        }
    }
   
    //Static Properties
    static var className: String = "Car"
   
    //Observed properties
    var color: String {
        willSet(newColor) {
            print("A cor do carro será alterada para \(newColor)")
        }
        didSet {
            print("A cor do carro foi alterada para \(oldValue) para \(color)")
        }
    }
   
    //Initializers
    convenience init() {
        self.init(brand: "", year: 0, color: "Black")
    }
   
    init (brand: String, year: Int,color: String) {
        self.brand = brand
        self.year = year
        self.color = color
        self._kms = 0
    }
   
    init (with color: String) {
        self.color = color
        brand = ""
        year = 0
        _kms = 0
    }
   
    deinit {
        print("Este objeto foi desalocado")
    }
}

class EletricCar: ObejctCar {
    var batteryCapacity: Int
    let powerConsumption: Double = 20.0
   
    init (brand: String, year: Int, color: String, batteryCapacity: Int) {
        self.batteryCapacity = batteryCapacity
        super.init(brand: brand, year: year, color: color)
    }
   
    override
    //Computed properties
    var IPVA: Double {
        return 0
    }
}

extension EletricCar {
    var autonomy: Double {
        return Double(batteryCapacity) / powerConsumption
    }
}

class GasCar: ObejctCar {
    var gasTankCapacity: Int
   
    init (brand: String, year: Int, color: String, gasTankCapacity: Int) {
        self.gasTankCapacity = gasTankCapacity
        super.init(brand: brand, year: year, color: color)
    }
}

var fusca: ObejctCar? = GasCar(brand: "WF", year: 1970, color: "Black", gasTankCapacity: 30)
var dolphin: ObejctCar? = EletricCar(brand: "BYD", year: 1970, color: "Black", batteryCapacity: 1000)

print(fusca?.brand ?? String())
print(dolphin?.brand ?? String())

if (fusca is GasCar) {
    let gasCar = fusca as? GasCar
    print(gasCar?.gasTankCapacity ?? 0)
}

if (dolphin is EletricCar) {
    let eletricCar = dolphin as! EletricCar
    print(eletricCar.batteryCapacity)
}

fusca = nil
dolphin = nil

//********** CÓDIGO 12  - GERENCIAMENTO DE MEMÓRIA - CICLOS DE REFERENCIA EM CLOSURES **********

class LazyObject {
    init() {
        print("Inicializando objeto tardio")
    }
    func printSomething() {
        print("Hello....")
    }
}

class LazyTest {
    lazy var lazyObject = LazyObject()
}

var lazyTest = LazyTest()
lazyTest.lazyObject.printSomething()

class OwnerFree {
    var name: String
    var cpf: String
    weak var car: CarFree?
   
    init(name: String, cpf: String) {
        self.name = name
        self.cpf = cpf
    }
   
    deinit {
        print("Este proprietario foi desalocado")
    }
}

class CarFree {
    //Stored properties
    var brand: String
    var year: Int
    weak var owner: OwnerFree?
    private var _kms: Int
   
    //Computed properties
    var IPVA: Double {
        return 0.5 * Double(year)
    }
   
    //Static Properties
    static var className: String = "Car"
   
    //Observed properties
    var color: String {
        willSet(newColor) {
            print("A cor do carro será alterada para \(newColor)")
        }
        didSet {
            print("A cor do carro foi alterada para \(oldValue) para \(color)")
        }
    }
   
    //Initializers
    convenience init() {
        self.init(brand: "", year: 0, color: "Black")
    }
   
    init (brand: String, year: Int,color: String) {
        self.brand = brand
        self.year = year
        self.color = color
        self._kms = 0
    }
   
    init (with color: String) {
        self.color = color
        brand = ""
        year = 0
        _kms = 0
    }
   
    var kms: Int {
        get {
            return _kms
        }
        set(newKms) {
            if newKms >= 0 {
                _kms = newKms
            } else {
                print("Erro:O valor não pode ser negativo.")
            }
        }
    }
   
    deinit {
        print("Este carro foi desalocado")
    }
}

class EletricCarFree: CarFree {
    var batteryCapacity: Int
    let powerConsumption: Double = 20.0
   
    init (brand: String, year: Int, color: String, batteryCapacity: Int) {
        self.batteryCapacity = batteryCapacity
        super.init(brand: brand, year: year, color: color)
    }
   
    override
    //Computed properties
    var IPVA: Double {
        return 0
    }
}

extension EletricCarFree {
    var autonomy: Double {
        return Double(batteryCapacity) / powerConsumption
    }
}

class GasCarFree: CarFree {
    var gasTankCapacity: Int
   
    init (brand: String, year: Int, color: String, gasTankCapacity: Int) {
        self.gasTankCapacity = gasTankCapacity
        super.init(brand: brand, year: year, color: color)
    }
}

var fuscaFree: CarFree? = GasCarFree(brand: "WF", year: 1970, color: "Black", gasTankCapacity: 30)
var dolphinFree: CarFree? = EletricCarFree(brand: "WF", year: 1970, color: "Black", batteryCapacity: 1000)

var proprietario1Free: OwnerFree? = OwnerFree(name: "Pedro", cpf: "345.868.943-43")
var proprietario2Free: OwnerFree? = OwnerFree(name: "Ana", cpf: "749.128.336-92")

fuscaFree?.owner = proprietario1Free
dolphinFree?.owner = proprietario2Free

proprietario1Free?.car = fuscaFree
proprietario2Free?.car = dolphinFree

fuscaFree = nil
dolphinFree = nil

proprietario1Free = nil
proprietario2Free = nil

class Detran {
    var printCar: (()->Void)?
}

class ClosureCar {
    var name = "This is a car"
    
    init(detran: Detran?) {
        detran?.printCar = { [unowned self] in
            print(self.name)
            //Cuidado, existem alternativas pois se car for desalocado antes vai dar ruim
            //[weak self] self?. (fazer if let do proprio self)
            //[unowned self] -> cuidado
        }
    }
    
    deinit {
        print("ClosureCar desalocado")
    }
}

var detran:Detran? = Detran()
var closureCar:ClosureCar? = ClosureCar(detran: detran)
detran?.printCar?()
closureCar = nil

//********** CÓDIGO 13  - PROTOCOLOS (VIEWCODABLE, DELEGATES DATASOURCES) **********

protocol SceneProtocol {
    func addComponents()
    func setConstraints()
    func otherConfigs()
}

extension SceneProtocol {
    func createScene() {
        addComponents()
        setConstraints()
        otherConfigs()
    }
    func otherConfigs(){/*not implemented*/}
}

class SceneLogin: SceneProtocol {
    init() {
        createScene()
    }
    
    func addComponents() {
        print("Monta a hierarquia da cena")
    }
    
    func setConstraints() {
        print("Define o posicionamento dos componentes")
    }
    
    func otherConfigs() {
        print("Configurações adicionais")
    }
}

class SceneProfile {
    init() {
       createScene()
    }
}

extension SceneProfile: SceneProtocol {
    func addComponents() {
        print("Monta a hierarquia da cena")
    }
    
    func setConstraints() {
        print("Define o posicionamento dos componentes")
    }
    
    func otherConfigs() {
        print("Configurações adicionais")
    }
}

var login = SceneLogin()
var profile = SceneProfile()

protocol ListDataSource {
    func numItems() -> Int
    func createItem(itemIndex: Int)
}

protocol ListDelegate {
    func didSelectItem(itemIndex: Int)
}

class ItenList {
    var dataSource: ListDataSource?
    var delegate: ListDelegate?
    func reloadList() {
        guard let dataSource = dataSource else { return }
        for item in 0..<dataSource.numItems() {
            dataSource.createItem(itemIndex: item)
        }
    }
    
    func tapItem(index: Int) {
        delegate?.didSelectItem(itemIndex: index)
    }
}


class SceneMenu: ListDelegate, ListDataSource {
    func numItems() -> Int {
        return 5
    }
    
    func createItem(itemIndex: Int) {
        print("item \(itemIndex) criado")
    }
    
    func didSelectItem(itemIndex: Int) {
        print("item \(itemIndex) clicado")
    }
}

var list = ItenList()
var menu = SceneMenu()

list.dataSource = menu
list.delegate = menu
list.reloadList()
list.tapItem(index: 4)


//********** CÓDIGO 14 - ENUMERATIONS **********
enum Resolution {
    case ldpi
    case mdpi
    case hdpi
    case xhdpi
}

var screenResolution: Resolution = Resolution.mdpi

enum Language {
    case c, pascal, fortran, java, swift, cpp, c_SHARP
}

print(Language.c_SHARP.hashValue)

var selectedLanguage: Language = Language.swift
switch selectedLanguage {
case .c:
    print("Language C")
case .pascal:
    print("Language PASCAL")
case .fortran:
    print("Language FORTRAN")
case .java:
    print("Language JAVA")
case .swift:
    print("Language SWIFT")
case .cpp:
    print("Language CPP")
case .c_SHARP:
    print("Language C_SHARP")
}

enum TransportMode {
    case bicycle(String, String)
    case vehicle(String, String, String)
}

var mountainBike = TransportMode.bicycle("GT", "Trail")
var vehicle = TransportMode.vehicle("FORD", "KA", "MGA - 1045")

var transportMode = vehicle
switch transportMode {
case .bicycle(let brand, let model):
    print("\(brand) \(model)")
case .vehicle(let brand, let model, let plate):
    print("\(brand) \(model) \(plate)")
}

enum Snack: Int {
    case grilled_cheese = 1, x_SALAD, x_BACON, juice = 20, beer, soda
}

var order = Snack.grilled_cheese
print("\(order.rawValue)")
order = Snack.x_SALAD
print("\(order.rawValue)")

order = Snack.juice
print("\(order.rawValue)")
order = Snack.soda
print("\(order.rawValue)")

var enumResult = Snack(rawValue: 20)
print(enumResult!.rawValue)

enum EducationLevel {
    case elementary, high_school, college, specialization, masters, doctorate
    
    mutating func nextLevel() {
        switch self {
        case .elementary:
            self = .high_school
        case .high_school:
            self = .college
        case .college:
            self = .specialization
        case .specialization:
            self = .masters
        case .masters:
            self = .doctorate
        case .doctorate:
            self = .doctorate
        }
    }
}

var education = EducationLevel.elementary
education.nextLevel()
print(education)
education.nextLevel()
print(education)
education.nextLevel()
print(education)
education.nextLevel()
print(education)
education.nextLevel()
print(education)


//********** CÓDIGO 15 - GENERICS EM SWIFT **********
func swapGenericValues<T>(dataA: inout T, dataB: inout T) {
    let copy = dataA
    dataA = dataB
    dataB = copy
}

var nameA = "Pedro"
var nameB = "Maria"
swapGenericValues(dataA: &nameA, dataB: &nameB)
print(nameA)
print(nameB)

class Stack<T> {
    var stackArray: [T]
    
    init() {
        stackArray = [T]()
    }
    
    func push(data: T) {
        stackArray.append(data)
    }
    
    func pop() -> T {
        return stackArray.removeLast()
    }
}

var stringStack = Stack<String>()
stringStack.push(data: "Maria")
stringStack.push(data: "João")
stringStack.push(data: "Pedro")
stringStack.push(data: "Ana")

print(stringStack.pop())
print(stringStack.pop())
print(stringStack.pop())
print(stringStack.pop())

//********** CÓDIGO 16 - PROGRAMAÇÃO CONCORRENTE com GCD **********

func doShomething(completion: @escaping ()->Void) {
    DispatchQueue.global(qos: .userInitiated).async {
        sleep(2)
        completion()
    }
}
print("inicio")
doShomething {
    print("1 - Dados carregados com sucesso!")
}
doShomething {
    print("2 - Dados carregados com sucesso!")
}
doShomething {
    print("3 - Dados carregados com sucesso!")
}
print("fim")

readLine()


func doShomethingMain(completion: @escaping ()->Void) {
    DispatchQueue.global(qos: .userInitiated).async {
        sleep(2)
        DispatchQueue.main.async {
            completion()
        }
    }
}
print("inicio")
doShomethingMain {
    print("1 - Dados carregados com sucesso! - Update UI")
}
doShomethingMain {
    print("2 - Dados carregados com sucesso! - Update UI")
}
doShomethingMain {
    print("3 - Dados carregados com sucesso! - Update UI")
}
print("fim")

_ = readLine()


let serialQueue = DispatchQueue(label: "com.example.serialQueue", qos: .userInitiated)
//let serialQueue = DispatchQueue(label: "com.example.serialQueue", qos: .userInitiated, attributes: .concurrent)
func doShomethingSync(completion: @escaping ()->Void) {
    serialQueue.async {
        sleep(2)
        completion()
    }
}
print("inicio")
doShomethingSync {
    print("1 - Dados carregados com sucesso!")
}
doShomethingSync {
    print("2 - Dados carregados com sucesso!")
}
doShomethingSync {
    print("3 - Dados carregados com sucesso!")
}
print("fim")
_ = readLine()


struct ResultData {
    var data1: String?
    var data2: String?
    var data3: String?
}

func doShomethingGroup(completion: @escaping (ResultData) -> Void) {
    let group = DispatchGroup()
    let queue = DispatchQueue.global(qos: .userInitiated)
    let syncQueue = DispatchQueue(label: "com.sync.queue") // Garantir acesso seguro a variáveis compartilhadas
    var result = ResultData()

    group.enter()
    queue.async {
        sleep(2)
        syncQueue.sync { result.data1 = "Dados da tarefa 1" }
        print("Tarefa 1 ok....")
        group.leave()
    }

    group.enter()
    queue.async {
        sleep(4)
        syncQueue.sync {result.data2 = "Dados da tarefa 2"}
        print("Tarefa 2 ok....")
        group.leave()
    }
    
    group.enter()
    queue.async {
        sleep(2)
        syncQueue.sync {result.data3 = "Dados da tarefa 3"}
        print("Tarefa 3 ok....")
        group.leave()
    }
    
    group.notify(queue: DispatchQueue.global()) {
        completion(result)
    }
}

print("Inicio")

doShomethingGroup { result in
    print("📊 Resultados: \(result)")
}

print("Fim")
_ = readLine()


//********** CÓDIGO 17  - PROGRAMAÇÃO CONCORRENTE COM OPERATIONQUEUE **********


func requestServerData(completion: @escaping(() -> Void)) {
    let queue = OperationQueue()
    
    queue.addOperation {
        sleep(2)
        print("Dados recebidos 1")
    }
    
    queue.addOperation {
        sleep(3)
        print("Dados recebidos 2")
    }
    
    queue.addOperation {
        sleep(1)
        print("Dados recebidos 3")
    }
}

requestServerData {
    print("fim")
}

_  = readLine()


func requestServerBlock(completion: @escaping(() -> Void)) {
    let queue = OperationQueue()
    
    let operationBlock1 = BlockOperation {
        sleep(3)
        print("Bloco 1")
    }
    operationBlock1.qualityOfService = .userInitiated
    
    let operationBlock2 = BlockOperation {
        sleep(1)
        print("Bloco 2")
    }
    operationBlock1.qualityOfService = .background
    
    let operationBlock3 = BlockOperation {
        sleep(2)
        print("Bloco 3")
    }
    operationBlock3.qualityOfService = .utility
    
    let completionBlock = BlockOperation {
        DispatchQueue.main.async {
            completion()
        }
    }
    
    operationBlock1.addDependency(operationBlock3)
    operationBlock3.addDependency(operationBlock2)
    completionBlock.addDependency(operationBlock1)
    
    queue.addOperations([operationBlock1, operationBlock2, operationBlock3, completionBlock], waitUntilFinished: false)
}

requestServerBlock{
    print("Fim")
}

RunLoop.main.run()


