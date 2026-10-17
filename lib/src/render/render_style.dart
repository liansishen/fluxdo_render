import 'package:flutter/material.dart';

/// 宿主应用可选注入的正文装饰样式(经 [ThemeData.extensions])。
///
/// 不注入时所有字段为 null,渲染沿用子包的默认外观(灰底 + 4px outline
/// 竖条的引用块、粗体标题等),对现有宿主零影响。宿主有自己的视觉体系时
/// (如 cfluxdo 的「墨笺」风格)按需覆盖其中几项即可。
@immutable
class FluxdoRenderStyle extends ThemeExtension<FluxdoRenderStyle> {
  const FluxdoRenderStyle({
    this.quoteBarColor,
    this.quoteBarWidth,
    this.quoteBackground,
    this.quoteRadius,
    this.quoteTextColor,
    this.quoteFontFamily,
    this.headingFontFamily,
    this.headingColor,
    this.ruleColor,
  });

  /// 引用块 / 引用卡左侧竖条颜色(默认 colorScheme.outline)
  final Color? quoteBarColor;

  /// 左侧竖条宽度(默认 4)
  final double? quoteBarWidth;

  /// 引用块 / 引用卡底色(默认 surfaceContainerHighest @ 0.3;
  /// 想去掉底色传 [Colors.transparent])
  final Color? quoteBackground;

  /// 引用块右侧圆角(默认 4)
  final double? quoteRadius;

  /// 引用块内文字颜色(默认 onSurfaceVariant)
  final Color? quoteTextColor;

  /// 引用块(`<blockquote>`)正文字体;引用卡(@回复)不受影响
  final String? quoteFontFamily;

  /// 正文 h1~h6 的字体
  final String? headingFontFamily;

  /// 正文 h1~h6 的颜色(默认随正文)
  final Color? headingColor;

  /// 分割线 `<hr>` 颜色(默认 outlineVariant @ 0.5)
  final Color? ruleColor;

  static FluxdoRenderStyle? of(BuildContext context) =>
      Theme.of(context).extension<FluxdoRenderStyle>();

  @override
  FluxdoRenderStyle copyWith({
    Color? quoteBarColor,
    double? quoteBarWidth,
    Color? quoteBackground,
    double? quoteRadius,
    Color? quoteTextColor,
    String? quoteFontFamily,
    String? headingFontFamily,
    Color? headingColor,
    Color? ruleColor,
  }) {
    return FluxdoRenderStyle(
      quoteBarColor: quoteBarColor ?? this.quoteBarColor,
      quoteBarWidth: quoteBarWidth ?? this.quoteBarWidth,
      quoteBackground: quoteBackground ?? this.quoteBackground,
      quoteRadius: quoteRadius ?? this.quoteRadius,
      quoteTextColor: quoteTextColor ?? this.quoteTextColor,
      quoteFontFamily: quoteFontFamily ?? this.quoteFontFamily,
      headingFontFamily: headingFontFamily ?? this.headingFontFamily,
      headingColor: headingColor ?? this.headingColor,
      ruleColor: ruleColor ?? this.ruleColor,
    );
  }

  @override
  FluxdoRenderStyle lerp(covariant FluxdoRenderStyle? other, double t) {
    if (other == null) return this;
    return FluxdoRenderStyle(
      quoteBarColor: Color.lerp(quoteBarColor, other.quoteBarColor, t),
      quoteBarWidth: t < 0.5 ? quoteBarWidth : other.quoteBarWidth,
      quoteBackground: Color.lerp(quoteBackground, other.quoteBackground, t),
      quoteRadius: t < 0.5 ? quoteRadius : other.quoteRadius,
      quoteTextColor: Color.lerp(quoteTextColor, other.quoteTextColor, t),
      quoteFontFamily: t < 0.5 ? quoteFontFamily : other.quoteFontFamily,
      headingFontFamily: t < 0.5 ? headingFontFamily : other.headingFontFamily,
      headingColor: Color.lerp(headingColor, other.headingColor, t),
      ruleColor: Color.lerp(ruleColor, other.ruleColor, t),
    );
  }
}
