class Sleeptracker < Formula
  desc "SRFF 기반 macOS 수면 리듬 감지 유틸리티"
  homepage "https://github.com/LimDonghyun/sleeptracker"
  url "https://github.com/LimDonghyun/sleeptracker/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "49d5a73259564e7bcd6c7e739e4f31ffabcc7f7a0c73d565e65cad57028d5736"
  version "0.1.1"
  license "MIT"

  depends_on "python@3.11"

  def install
    system "python3", "-m", "venv", "venv"
    system "./venv/bin/pip", "install", "-r", "requirements.txt"
    bin.install "cli/run_tracker.py" => "sleeptracker"
    prefix.install "xyz.extho.sleeptracker.mac.wakeup.plist"
  end

  def caveats
    <<~EOS
      📦 SleepTracker 설치 완료

      ▶ launchd 등록:
         cp #{opt_prefix}/xyz.extho.sleeptracker.mac.wakeup.plist ~/Library/LaunchAgents/
         launchctl load -w ~/Library/LaunchAgents/xyz.extho.sleeptracker.mac.wakeup.plist

      ▶ 실행:
         sleeptracker

      ▶ 설치 위치:
         #{opt_prefix}
    EOS
  end
end
