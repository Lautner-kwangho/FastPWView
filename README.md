# FastPWView

[![CI Status](https://img.shields.io/travis/wooree2716@khcu.ac.kr/FastPWView.svg?style=flat)](https://travis-ci.org/wooree2716@khcu.ac.kr/FastPWView)
[![Version](https://img.shields.io/cocoapods/v/FastPWView.svg?style=flat)](https://cocoapods.org/pods/FastPWView)
[![License](https://img.shields.io/cocoapods/l/FastPWView.svg?style=flat)](https://cocoapods.org/pods/FastPWView)
[![Platform](https://img.shields.io/cocoapods/p/FastPWView.svg?style=flat)](https://cocoapods.org/pods/FastPWView)

## Installation

FastPWView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:
<br/>(Cocopod을 이용하여 사용할 수 있습니다! 다음과 같이 Podfile을 설정해주세요, 곧 SPM도 업데이트 하도록 하겠습니다!)

```ruby
pod 'FastPWView'
```

```ruby
// SPM Support 
https://github.com/Lautner-kwangho/FastPWView.git
```


## Using

How to use it can be used simply as follows!
<br/>(사용방법은 아래와 같이 심플하게 사용할 수 있습니다!)
```ruby
let pwView = FastView(.basic) // or .expansion

view.addSubView(pwView)

( set pwView Layout )
// Property
// 비밀번호 입력 완료시 true ( Returns true when the password is complete )
pwView.pwFlag: Bool?

// 입력한 비밀번호 ( Input Password )
pwView.pwNumber: String?

// Method
// 비밀번호 사이 여백 설정 ( Sets the spacing between passwords )
pwView.spacing(CGFloat)

// 비밀번호 입력 전 이미지 ( Image before entering password )
pwView.beforeImage(_ image: UIImage)

// 비밀번호 입력 후 이미지 ( Image after entering password )
pwView.afterImage(_ image: UIImage)

// 비밀번호 Tint Color ( Password Tint Color )
pwView.pwTintColor(_ color: UIColor)

// FastView 배경 색상 ( FastView Background Color )
pwView.background(_ backgroundColor: UIColor)
 
```


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.
```ruby
import FastPWView

let pwView = FastView(.basic)

view.addSubView(pwView)
```
- 기본 화면
** (gif 올릴 예정)

- 활용
** 배달의 민족( 배민 페이 ) PIN 처럼 커스텀 가능합니다 

## Requirements

Unable to use because error correction is currently in progress; available after correction
<br/>
```ruby
available( iOS 13, *)
```


## Author

광호 (kwangho), [E-mail](wooree2716@gmail.com)


## License

FastPWView is available under the MIT license. See the LICENSE file for more info.
