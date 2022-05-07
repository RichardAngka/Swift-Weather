//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Richard Angkawinata on 05/05/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            GradientBackground(topColor: .blue, bottomColor: Color("lightBlue"))
            VStack {
                CityTextView(cityName: "Cuppertino, CA")
                MainWeatherStatusView(weatherIcon: "cloud.sun.fill", weatherDegree: "35")
                .padding(.bottom, 40)

                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 74)
                    WeatherDayView(dayOfWeek: "WED", imageName: "cloud.rain.fill", temperature: 74)
                    WeatherDayView(dayOfWeek: "THU", imageName: "cloud.bolt.fill", temperature: 74)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "cloud.sun.rain.fill", temperature: 54)
                    WeatherDayView(dayOfWeek: "SAT", imageName: "cloud.moon.fill", temperature: 34)
                }
                
                Spacer()
                
                Button{
                    print("tapped")
                }label: {
                    WeatherButton(weatherText: "Change Day Time", buttonColor: .white, textColor: .blue)
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct GradientBackground: View {
    
    var topColor: Color
    var bottomColor: Color
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors:[topColor, bottomColor]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View{
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    
    var weatherIcon: String
    var weatherDegree: String
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: weatherIcon)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(weatherDegree)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct WeatherButton: View {
    
    var weatherText: String
    var buttonColor: Color
    var textColor: Color
    
    var body: some View {
        Text(weatherText)
            .frame(width: 280, height: 50)
            .background(buttonColor)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
    }
}
