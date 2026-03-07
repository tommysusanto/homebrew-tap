class Ytalk < Formula
  include Language::Python::Virtualenv

  desc "Download YouTube videos, transcribe with Whisper, and chat with Ollama"
  homepage "https://github.com/tommysusanto/ytalk"
  url "https://github.com/tommysusanto/ytalk/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "PLACEHOLDER"
  license "MIT"

  depends_on "python@3.12"
  depends_on "ffmpeg"
  depends_on "ollama"

  # Resource stanzas for Python-only deps (requests, textual, yt-dlp, openai-whisper)
  # Generated via: brew update-python-resources Formula/ytalk.rb
  # These are filled in after tagging v0.1.0

  def install
    virtualenv_install_with_resources
  end

  def post_install
    ohai "Run 'ollama pull gemma3:4b' to download a chat model"
  end

  def caveats
    <<~EOS
      Ollama must be running for chat/summarization to work.
      Start it with: brew services start ollama
      Then pull a model: ollama pull gemma3:4b
    EOS
  end

  test do
    assert_match "usage", shell_output("#{bin}/ytalk --help", 2)
  end
end
