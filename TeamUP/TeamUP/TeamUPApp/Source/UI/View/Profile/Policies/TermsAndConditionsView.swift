//
//  TermsAndCoditionsView.swift
//  TeamUP
//
//  Created by Jaemin Hong on 11/17/24.
// 

import SwiftUI

struct TermsAndConditionsView: View {
    private let padding: CGFloat = 20
    private let message: String = """
                                  본 이용약관은 FOURSIX(이하 "서비스 제공자")가 무료 서비스로 제공하는 모바일 기기용 TeamUp 앱(이하 "애플리케이션")에 적용됩니다.

                                  애플리케이션을 다운로드하거나 사용함으로써 귀하는 다음 약관에 자동으로 동의하게 됩니다. 애플리케이션을 사용하기 전에 본 약관을 자세히 읽고 이해하시기 바랍니다. 애플리케이션 또는 그 일부, 당사의 상표를 무단으로 복사하거나 수정하는 것은 엄격히 금지됩니다. 애플리케이션의 소스 코드를 추출하거나 다른 언어로 번역하거나 파생 버전을 만드는 시도는 허용되지 않습니다. 애플리케이션과 관련된 모든 상표권, 저작권, 데이터베이스 권리 및 기타 지적 재산권은 서비스 제공자에게 귀속됩니다.

                                  서비스 제공자는 애플리케이션이 최대한 유용하고 효율적이도록 최선을 다하고 있습니다. 이에 따라 언제든지 어떤 이유로든 애플리케이션을 수정하거나 서비스에 대해 요금을 청구할 권리를 보유합니다. 서비스 제공자는 애플리케이션 또는 그 서비스에 대한 요금이 발생하는 경우 이를 명확히 고지할 것을 보증합니다.

                                  애플리케이션은 귀하가 서비스 제공자에게 제공한 개인 데이터를 저장하고 처리하여 서비스를 제공합니다. 귀하는 휴대폰과 애플리케이션에 대한 접근 권한을 안전하게 유지할 책임이 있습니다. 서비스 제공자는 휴대폰의 공식 운영 체제가 부과한 소프트웨어 제한 및 한계를 제거하는 탈옥(jailbreaking)이나 루팅(rooting)을 강력히 권장하지 않습니다. 이러한 행위는 귀하의 휴대폰을 멀웨어, 바이러스, 악성 프로그램에 노출시키고 휴대폰의 보안 기능을 손상시킬 수 있으며, 그 결과 애플리케이션이 올바르게 작동하지 않을 수 있습니다.

                                  서비스 제공자는 특정 측면에 대해 책임을 지지 않는다는 점을 유념하시기 바랍니다. 애플리케이션의 일부 기능은 Wi-Fi 또는 귀하의 모바일 네트워크 제공자가 제공하는 활성 인터넷 연결이 필요합니다. 귀하가 Wi-Fi에 접속하지 못하거나 데이터 사용량이 소진되어 애플리케이션이 완전한 기능을 발휘하지 못하는 경우, 서비스 제공자는 이에 대한 책임을 지지 않습니다.

                                  Wi-Fi 영역 외부에서 애플리케이션을 사용할 경우, 귀하의 모바일 네트워크 제공자의 약관이 계속 적용된다는 점을 유의하시기 바랍니다. 따라서 애플리케이션에 연결하는 동안 데이터 사용으로 인해 모바일 제공자로부터 요금이 부과되거나 기타 제3자로부터 요금이 부과될 수 있습니다. 애플리케이션을 사용함으로써 귀하는 이러한 모든 요금, 특히 데이터 로밍을 비활성화하지 않고 국내 영토(즉, 지역 또는 국가) 외부에서 애플리케이션을 사용할 경우 발생하는 로밍 데이터 요금에 대한 책임을 수락합니다. 귀하가 애플리케이션을 사용하는 기기의 요금 납부자가 아닌 경우, 귀하는 요금 납부자로부터 허가를 받은 것으로 간주합니다.

                                  마찬가지로, 서비스 제공자는 항상 귀하의 애플리케이션 사용에 대한 책임을 지지 않을 수 있습니다. 예를 들어, 귀하의 기기가 충전된 상태를 유지하는 것은 귀하의 책임입니다. 기기의 배터리가 소진되어 서비스를 이용할 수 없는 경우, 서비스 제공자는 이에 대한 책임을 지지 않습니다.

                                  서비스 제공자의 애플리케이션 사용에 대한 책임과 관련하여, 서비스 제공자는 애플리케이션이 항상 업데이트되고 정확하도록 노력하지만, 제3자로부터 정보를 받아 이를 귀하에게 제공한다는 점을 유념하시기 바랍니다. 서비스 제공자는 애플리케이션의 이 기능에 전적으로 의존함으로써 발생하는 직접 또는 간접적인 손실에 대해 어떠한 책임도 지지 않습니다.

                                  서비스 제공자는 향후 애플리케이션을 업데이트하고자 할 수 있습니다. 애플리케이션은 현재 운영 체제의 요구 사항에 따라 제공되며(추가 시스템에 대한 제공 범위를 확장할 수 있음), 애플리케이션을 계속 사용하려면 업데이트를 다운로드해야 할 수 있습니다. 서비스 제공자는 애플리케이션이 항상 귀하에게 관련성이 있거나 귀하의 기기에 설치된 특정 운영 체제 버전과 호환될 것이라고 보장하지 않습니다. 그러나 귀하는 제공되는 경우 항상 애플리케이션 업데이트를 수락하는 것에 동의합니다. 또한 서비스 제공자는 애플리케이션 제공을 중단하고 언제든지 귀하에게 종료 통지 없이 그 사용을 종료할 수 있습니다. 별도로 통지하지 않는 한, 종료 시 (a) 본 약관에서 귀하에게 부여된 권리와 라이선스는 종료되며; (b) 귀하는 애플리케이션 사용을 중단하고 (필요한 경우) 기기에서 삭제해야 합니다.

                                  이 약관의 변경

                                  서비스 제공자는 주기적으로 이용약관을 업데이트할 수 있습니다. 따라서 이 페이지를 정기적으로 검토하여 변경 사항을 확인하시기 바랍니다. 서비스 제공자는 이 페이지에 새로운 이용약관을 게시하여 모든 변경 사항을 통지할 것입니다.

                                  본 이용약관은 2024년 11월 17일부터 유효합니다.

                                  문의하기

                                  이용약관에 대한 질문이나 제안 사항이 있으시면 teamupofficial2024@gmail.com으로 서비스 제공자에게 문의하시기 바랍니다.
                                  """
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Divider()
                    .padding(.horizontal, -padding)
                Spacer()
                    .frame(height: 1)
                Text(message)
                    .font(.semibold18)
            }
            .padding(.horizontal, padding)
            .navigationTitle("이용약관")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem (placement: .topBarLeading) {
                    BackButtonBlack()
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        TermsAndConditionsView()
    }
}
