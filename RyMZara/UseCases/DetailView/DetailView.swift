//
//  DetailView.swift
//  RyMZara
//
//  Created by GonzaloMR on 17/4/24.
//

import SwiftUI

struct DetailView: View {

  @State var character: RyMResult!

  var body: some View {
    VStack {
      Text(character.name)
        .font(.title)
      CachedAsyncImage(url: URL(string: character.image)) { phase in
        switch phase {
        case .empty:
          ProgressView()
        case .success(let image):
          ZStack(alignment: .top) {
            image.resizable()
              .aspectRatio(contentMode: .fit)
              .cornerRadius(12)
              .clipShape(RoundedRectangle(cornerRadius: 12))
              .overlay {
                switch character.status {
                case .alive:
                  RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.green, lineWidth: 2)
                case .dead:
                  RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.red, lineWidth: 2)
                case .unknown:
                  RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.brown, lineWidth: 2)
                }
              }
          }
        case .failure:
          Image("error")
            .resizable()
            .scaledToFit()
        @unknown default:
          Image("error")
            .resizable()
            .scaledToFit()
        }
      }
      StatusView
      LocationView
      OriginView
      Spacer()
    }
    .padding([.horizontal], 12)
  }

  var StatusView: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 8)
        .foregroundColor(Color(red: 0.704, green: 0.851, blue: 0.998))
      VStack {
        Text("Status:")
          .font(.title2)
          .foregroundColor(Color("text"))
          .frame(maxWidth: .infinity, alignment: .leading)
          .padding(.bottom, 1)
        HStack {
          Text(character.status.rawValue)
            .font(.body)
            .foregroundColor(Color("text"))
          Text(" - ")
            .font(.body)
            .foregroundColor(Color("text"))
          Text(character.species)
            .font(.body)
            .foregroundColor(Color("text"))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
      }
      .frame(maxWidth: .infinity, alignment: .leading)
      .padding(.horizontal, 12.0)
    }
    .frame(height: 75)
  }

  var OriginView: some View {
    HStack {
      ZStack {
        RoundedRectangle(cornerRadius: 12)
          .foregroundColor(Color(red: 0.704, green: 0.851, blue: 0.998))
        VStack {
          Text("Origin:")
            .font(.title2)
            .foregroundColor(Color("text"))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 1)
          Text(character.origin.name)
            .font(.body)
            .foregroundColor(Color("text"))
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 12.0)
      }
      .frame(height: 75)
    }
  }

  var LocationView: some View {
    HStack {
      ZStack {
        RoundedRectangle(cornerRadius: 12)
          .foregroundColor(Color(red: 0.704, green: 0.851, blue: 0.998))
        VStack {
          Text("Location:")
            .font(.title2)
            .foregroundColor(Color("text"))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 1)
          Text(character.location.name)
            .font(.body)
            .foregroundColor(Color("text"))
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 12.0)
      }
      .frame(height: 75)
    }
  }
}

#Preview {
  DetailView(character: RyMResult(id: 1, name: "Rick Sanchez", species: "Human", type: "", status: .alive, gender: "Male", origin: Location(name: "Earth (C-137)", url: "https://rickandmortyapi.com/api/location/1"), location: Location(name: "Citadel of Ricks", url: "https://rickandmortyapi.com/api/location/3"), image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", episode: ["https://rickandmortyapi.com/api/episode/1", "https://rickandmortyapi.com/api/episode/2"], url: "https://rickandmortyapi.com/api/character/1", created: "2017-11-04T18:48:46.250Z"))
}
