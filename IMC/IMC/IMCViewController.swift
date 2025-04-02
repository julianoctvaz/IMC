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
    
    lazy var IMCtitle: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var massSlider: UISlider = {
        let view = UISlider()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var heighSlider: UISlider = {
        let view = UISlider()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var calculateButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var subtitleResultLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var imageResult: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var verticalScrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var containerView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var massSliderLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var heighSliderLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var converterLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var switchConverter: UISwitch = {
        let view = UISwitch()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var converterAndSwitchStack: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    
    // MARK: - Initializer
    
    // se for incializar os dados nao precisa desses inits
    init(mass: Double, height: Double) {
        self.mass = mass
        self.height = height
        super.init(nibName: nil, bundle: nil) // tem que vir depois( se for inicializar xib) pois precisamos setar as props de self antes de incialiar a nossa VC
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        // seria para carregar um storyboard ams nao temos
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad() // esse pode vir depois
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

        containerView.addArrangedSubview(IMCtitle)
        
        containerView.addArrangedSubview(converterAndSwitchStack)
        
        converterAndSwitchStack.addArrangedSubview(converterLabel)
        converterAndSwitchStack.addArrangedSubview(switchConverter)
        
        containerView.addArrangedSubview(massSlider)
        containerView.addArrangedSubview(massSliderLabel)
        containerView.addArrangedSubview(heighSlider)
        containerView.addArrangedSubview(heighSliderLabel)
        containerView.addArrangedSubview(calculateButton)
        containerView.addArrangedSubview(subtitleResultLabel)
        containerView.addArrangedSubview(imageResult)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            verticalScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            verticalScrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            verticalScrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            verticalScrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),

            
            
            containerView.topAnchor.constraint(equalTo: verticalScrollView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: verticalScrollView.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: verticalScrollView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: verticalScrollView.trailingAnchor),
            containerView.widthAnchor.constraint(equalTo: verticalScrollView.widthAnchor),
            
            massSlider.widthAnchor.constraint(equalToConstant: 300),
            heighSlider.widthAnchor.constraint(equalToConstant: 300),
            
        ])
    }
    
    private func setupUIStyle() {
        view.backgroundColor = .systemIndigo
        
        containerView.axis = .vertical
        containerView.spacing = 50
        containerView.distribution = .equalSpacing
        containerView.alignment = .center
        
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
        
        converterAndSwitchStack.axis = .horizontal
        converterAndSwitchStack.spacing = 16
        converterAndSwitchStack.alignment = .center
        converterAndSwitchStack.distribution = .equalSpacing

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
        
        heighSliderLabel.text = "Valor: 75 cm"
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
    
    
    // MARK: - Actions
    
    private func setupActions() {
        switchConverter.addTarget(self, action: #selector(didToggleSwitch), for: .valueChanged)
        
        massSlider.addTarget(self, action: #selector(slidersValueChanged), for: .valueChanged)
        
        heighSlider.addTarget(self, action: #selector(slidersValueChanged), for: .valueChanged)
        
        calculateButton.addTarget(self, action: #selector(didTapCalculateButton), for: .touchUpInside)
        
    }
    
   @objc private func didToggleSwitch(_ sender: UISwitch) {
       if sender.isOn {
           showSwitchAlert()
           mass = kgToLibra(mass)
       } else {
           mass = LibratoKg(mass)
       }
       
    }
    
    @objc private func slidersValueChanged() {
        let unidade = switchConverter.isOn ? "lb" : "kg"
        massSliderLabel.text = "Valor: \(Int(massSlider.value)) \(unidade)"
        heighSliderLabel.text = "Valor: \(Int(heighSlider.value)) cm"
    }
    
    @objc private func didTapCalculateButton() {
        let resultIMC = calculateIMC(mass, height)
        let names = changeTextAndImageResult(resultIMC)
        
        subtitleResultLabel.text = names.subtitleResultLabel
        subtitleResultLabel.isHidden = false
        imageResult.image = UIImage(named: names.imageName)
    }


    // MARK: - Alerts

    private func showSwitchAlert() {
        let alert = UIAlertController(
            title: "ATENCAO",
            message: "A unidade de massa agora é Libra",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        present(alert, animated: true)
    }
    
    
    // MARK: - IMC Functions

    func calculateIMC(_ mass: Double, _ height: Double) -> Double {
        return 0.0
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
