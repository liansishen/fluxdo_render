# fluxdo_render

fluxdo 自研帖子渲染引擎(Node 模型 + 自研选区 + 虚拟化)。

## 状态

已具备帖子渲染、自研跨块选区、虚拟化及富文本编辑能力。本地 fork 的公共基线为
`f8d834b10fa280b4213ffa8ba9ed3e1032572c6d`，现已按文件合入上游
`5bfd16be83d7b7cb89740bef0b97ca4f95168aaf`，保留本地 `FluxdoRenderStyle` 主题扩展。

### 公开入口与兼容性

- `fluxdo_render.dart`：只读渲染与选区接口，继续导出 `FluxdoRenderStyle`。
  宿主可通过 `ThemeData.extensions` 覆盖引用块／引用卡的底色、侧边条、圆角，
  引用块正文字体与颜色、标题字体与颜色，以及分割线颜色；未注入时沿用默认样式。
- `editor.dart`：编辑器、对象选择／操作、三指手势、光标可见区跟踪及表格行列动作。
  `FluxdoEditor` 提供语义粘贴、上传占位、图片网格上传、编辑活动和宿主遮挡量等接入参数。
- `semantic_editor.dart`：生产语义文档、`SemanticDocumentCodec` 与 `SemanticEditorSession`。
  提交须使用会话导出的语义树；语义模式不经旧块模型的 Markdown 导出链路。
  语义节点来源、事务、片段及临时上传节点说明见
  `lib/src/editor/semantic_editor/README.md`，移植算法及许可证随源码保留。

本次同步覆盖语义编辑内核、原生阅读／编辑选区、对象操作、图片组编辑、表格输入连接与移动端行列操作。
同时包含自动定位时内容缩短导致正文空白的修复，以及裸自动链接导入后光标坐标错位的修复；
后者保留链接逐字编辑坐标和 `linkify`／`bare` 来源，显式原子链接及附件仍保持原子语义。
阅读／编辑手势规则见 `docs/selection_gesture_policy.md`。

## 开发

本仓库设计为 [fluxdo 主仓](https://github.com/Lingyan000/fluxdo) 的 git submodule
挂载在 `packages/fluxdo_render/` 下。

### 单独使用本仓

```bash
git clone git@github.com:Lingyan000/fluxdo_render.git
cd fluxdo_render
flutter pub get
flutter test
```

### 在主仓内开发(推荐)

主仓内会通过 submodule 引入本仓:

```bash
# 初次:
git clone --recursive git@github.com:Lingyan000/fluxdo.git
# 或已 clone 后:
git submodule update --init packages/fluxdo_render
```

直接修改 `packages/fluxdo_render/` 下的代码即可,主仓会通过
workspace 自动联调。修改完成后:

```bash
cd packages/fluxdo_render
git add .
git commit -m "..."
git push

cd ../..  # 回主仓
git add packages/fluxdo_render
git commit -m "chore: bump fluxdo_render"
git push
```

## License

跟随主项目。
