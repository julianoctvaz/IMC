//
//  UIViewController.swift
//  IMC
//
//  Created by Juliano on 17/03/25.
//

import UIKit

//enum MassUnit { // poderia ser um caminho também para tratar a diferença de massas
//    case kg
//    case lb
//}

class IMCViewController: UIViewController {
    
    // MARK: - Properties
    
    private var mass: Double
    private var height: Double
    
    // MARK: - UI Elements
    
    @AutoLayoutView var IMCtitle: UILabel
    @AutoLayoutView var massSlider: UISlider
    @AutoLayoutView var heighSlider: UISlider
    @AutoLayoutView var calculateButton: UIButton
    @AutoLayoutView var subtitleResultLabel: UILabel
    @AutoLayoutView var imageResult: UIImageView
    @AutoLayoutView var verticalScrollView: UIScrollView
    @AutoLayoutView var containerView: UIView
    
    //Converter
    @AutoLayoutView var massSliderLabel: UILabel
    @AutoLayoutView var heighSliderLabel: UILabel
    @AutoLayoutView var converterLabel: UILabel
    @AutoLayoutView var switchConverter: UISwitch
    
//    Desafio Stack
//    @AutoLayoutView var converterAndSwitchStack: UIStackView

    
    // MARK: - Initializer
    
    // se for incializar os dados nao precisa desses inits
    init(mass: Double, height: Double) {
        self.mass = mass
        self.height = height
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        setupView()
    }
    
    
    // MARK: - Setup UI
    
    private func setupView() {
        addSubViews()
        setupConstraints()
        setupUIStyle()
        setupActions()
    }
    
    private func addSubViews() {
        
        
        view.addSubview(verticalScrollView)
        verticalScrollView.addSubview(containerView)

        containerView.addSubview(IMCtitle)
        
        containerView.addSubview(converterLabel)
        containerView.addSubview(switchConverter)
        
//        #desafio Stack
//        containerView.addSubview(converterAndSwitchStack)
//        converterAndSwitchStack.addArrangedSubview(converterLabel)
//        converterAndSwitchStack.addArrangedSubview(switchConverter)
        
        containerView.addSubview(massSlider)
        containerView.addSubview(massSliderLabel)
        containerView.addSubview(heighSlider)
        containerView.addSubview(heighSliderLabel)
        containerView.addSubview(calculateButton)
        containerView.addSubview(subtitleResultLabel)
        containerView.addSubview(imageResult)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
     
            verticalScrollView.topAnchor.constraint(equalTo: view.topAnchor),
            verticalScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            verticalScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            verticalScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            containerView.topAnchor.constraint(equalTo: verticalScrollView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: verticalScrollView.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: verticalScrollView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: verticalScrollView.trailingAnchor),
            containerView.widthAnchor.constraint(equalTo: verticalScrollView.widthAnchor),
            
            
            IMCtitle.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 64),
            IMCtitle.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            IMCtitle.widthAnchor.constraint(equalToConstant: 152),
            
            // aqui um EMBAIXO UM DO OUTRO
            converterLabel.topAnchor.constraint(equalTo: IMCtitle.bottomAnchor, constant: 16),
            converterLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            converterLabel.widthAnchor.constraint(equalToConstant: 152),
            converterLabel.heightAnchor.constraint(equalToConstant: 40),
            
            switchConverter.topAnchor.constraint(equalTo: converterLabel.bottomAnchor, constant: 16),
            switchConverter.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            
           // aqui de LADINHO
//            converterLabel.topAnchor.constraint(equalTo: IMCtitle.bottomAnchor, constant: 16),
//            converterLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            // alinhado à esquerda
            
            //alinhando no centro
//            converterLabel.topAnchor.constraint(equalTo: IMCtitle.bottomAnchor, constant: 16),
//            converterLabel.leadingAnchor.constraint(equalTo: IMCtitle.leadingAnchor, constant: -30),
//            switchConverter.trailingAnchor.constraint(equalTo: IMCtitle.trailingAnchor, constant: 30),
            
            
            //DESAFIO STACK
//            converterLabel.widthAnchor.constraint(equalToConstant: 152),
//            converterLabel.heightAnchor.constraint(equalToConstant: 40),
//
//            switchConverter.centerYAnchor.constraint(equalTo: converterLabel.centerYAnchor), // mesmo centro vertical
//            switchConverter.leadingAnchor.constraint(equalTo: converterLabel.trailingAnchor, constant: 12), // do lado direito da label

//            converterAndSwitchStack.topAnchor.constraint(equalTo: IMCtitle.bottomAnchor, constant: 16),
//            converterAndSwitchStack.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
//            converterAndSwitchStack.widthAnchor.constraint(equalToConstant: 164),
            
            massSlider.topAnchor.constraint(equalTo: switchConverter.bottomAnchor, constant: 32),
            massSlider.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            massSlider.widthAnchor.constraint(equalToConstant: 152),
            massSlider.heightAnchor.constraint(equalToConstant: 40),
            
            massSliderLabel.topAnchor.constraint(equalTo: massSlider.bottomAnchor, constant: 32),
            massSliderLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            massSliderLabel.widthAnchor.constraint(equalToConstant: 152),
            massSliderLabel.heightAnchor.constraint(equalToConstant: 40),
            
            heighSlider.topAnchor.constraint(equalTo: massSliderLabel.bottomAnchor,constant: 16),
            heighSlider.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            heighSlider.widthAnchor.constraint(equalToConstant: 152),
            heighSlider.heightAnchor.constraint(equalToConstant: 40),
            
            heighSliderLabel.topAnchor.constraint(equalTo: heighSlider.bottomAnchor, constant: 32),
            heighSliderLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            heighSliderLabel.widthAnchor.constraint(equalToConstant: 152),
            heighSliderLabel.heightAnchor.constraint(equalToConstant: 40),
            
            calculateButton.topAnchor.constraint(equalTo: heighSliderLabel.bottomAnchor,constant: 32),
            calculateButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            calculateButton.widthAnchor.constraint(equalToConstant: 128),
            calculateButton.heightAnchor.constraint(equalToConstant: 32),
            
            subtitleResultLabel.widthAnchor.constraint(equalToConstant: 150),
            subtitleResultLabel.topAnchor.constraint(equalTo: calculateButton.bottomAnchor, constant: 32),
            subtitleResultLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            
            imageResult.topAnchor.constraint(equalTo: subtitleResultLabel.bottomAnchor, constant: 32),
            imageResult.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            imageResult.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 40)
        ])
    }
    
    private func setupUIStyle() {
        view.backgroundColor = .red
        verticalScrollView.backgroundColor = .systemIndigo
        
        IMCtitle.textAlignment = .center
        IMCtitle.font = UIFont(name: "HelveticaNeue", size: 30)
        IMCtitle.backgroundColor = .systemYellow
        IMCtitle.text = "IMC"
        
        switchConverter.setOn(false, animated: true)
        switchConverter.onTintColor = .orange
        switchConverter.thumbTintColor = .white
        switchConverter.backgroundColor = .blue.withAlphaComponent(0.4)
        switchConverter.layer.cornerRadius = 16 // teria q colocar isso!
        
        converterLabel.text = "Kg to Libra:"
        converterLabel.backgroundColor = .yellow
        converterLabel.textAlignment = .center
        
//        Desafio STACK
//        converterAndSwitchStack.translatesAutoresizingMaskIntoConstraints = false
//        converterAndSwitchStack.axis = .horizontal
//        converterAndSwitchStack.spacing = 12
//        converterAndSwitchStack.alignment = .center
//        converterAndSwitchStack.distribution = .equalSpacing

        
        massSlider.backgroundColor = .systemGray2
        massSlider.minimumValue = 0
        massSlider.maximumValue = 200 // kg
        massSlider.value = 50
        
        heighSlider.backgroundColor = .systemGray2
        heighSlider.minimumValue = 0
        heighSlider.maximumValue = 250 // cm
        heighSlider.value = 75
        
        massSliderLabel.text = "Valor: 50 kg"
        massSliderLabel.textAlignment = .center
        massSliderLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        massSliderLabel.textColor = .white
        
        heighSliderLabel.text = "Valor: 75"
        heighSliderLabel.textAlignment = .center
        heighSliderLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        heighSliderLabel.textColor = .white
        
        calculateButton.backgroundColor = .systemTeal
        calculateButton.setTitle("Calcular", for: .normal)
        calculateButton.layer.cornerRadius = 5
        
        subtitleResultLabel.textAlignment = .center
        subtitleResultLabel.backgroundColor = .systemYellow
        subtitleResultLabel.text = "Resultado"
        subtitleResultLabel.isHidden = true
        
        imageResult.contentMode = .scaleAspectFill
    }
    
    private func setupActions() {
        //sliders
        massSlider.addTarget(self, action: #selector(slidersValueChanged), for: .valueChanged)
        heighSlider.addTarget(self, action: #selector(slidersValueChanged), for: .valueChanged)
        
        //switch
//        switchConverter.addTarget(self, action: #selector(didToggleSwitch(_:)), for: .valueChanged)
        //opcao de escrita...
        switchConverter.addTarget(self, action: #selector(didToggleSwitch), for: .valueChanged)
        //botao
        calculateButton.addTarget(self, action: #selector(didTapCalculateButton), for: .touchUpInside)
    
    }
    
    private func updateUI() {
        massSlider.value = Float(mass)
        let unidade = switchConverter.isOn ? "lb" : "kg"
        massSliderLabel.text = "Valor: \(Int(massSlider.value)) \(unidade)"
        
    }
    
    // MARK: - Actions
    
    @objc private func didTapCalculateButton() {

//        showErrorAlert() // exemplo alerta
        
        let resultIMC = calculateIMC(mass, height)
        let name = changeTextAndImageResult(resultIMC)
        subtitleResultLabel.text = name.subtitleResultLabel
        imageResult.image = UIImage(named: name.imageName)
        subtitleResultLabel.isHidden = false
    }
    
    @objc func slidersValueChanged() {
        massSliderLabel.text = "Valor: \(Int(massSlider.value))"
        heighSliderLabel.text = "Valor: \(Int(heighSlider.value))"
      }
    
    @objc private func didToggleSwitch(_ sender: UISwitch) {
        //se nao quiseremos colocar o nosso enviante aqui, poderiamos fazer direto com o componente
//        if switchConverter.isOn {
        if sender.isOn {
            mass = kgToLibra(mass)
            
        } else {
            mass = LibratoKg(mass)
        }
        updateUI()
    }

    // MARK: - Alerts

    private func showErrorAlert() {
        let alert = UIAlertController(title: "Erro nos dados", message: "Algo errado aconteceu. \nConfira seus dados.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert, animated: true)
    }
    
    // MARK: - IMC Functions

    func calculateIMC(_ mass: Double, _ height: Double) -> Double {
        if switchConverter.isOn {
            // Fórmula adaptada para libras e altura em cm
            return mass / pow(height, 2) * 703.0
        } else {
            // Fórmula padrão em kg e altura em cm
            return mass / pow(height, 2) * 10000.0
        }
    }
    
    func changeTextAndImageResult(_ resultIMC: Double) -> (subtitleResultLabel: String, imageName: String) {
        switch resultIMC {
          case 0..<18.5:
              return ("Abaixo do peso", "Magro.png")
          case 18.5..<25:
              return ("Peso normal", "Normal.png")
          case 25..<30:
              return ("Sobrepeso", "Sobrepeso.png")
          case 30..<40:
              return ("Obeso", "Obeso.png")
          case 40...:
              return ("Obesidade mórbida", "ObesidadeMorbida.png")
          default:
              return ("Erro!", "Erro.png")
          }
    }
    
    func kgToLibra(_ kg: Double) -> Double {
        return 2.2*kg
    }
    func LibratoKg(_ libra: Double) -> Double {
        return libra/2.2
    }
}

#Preview {
    IMCViewController(mass: 10, height: 20)
}
