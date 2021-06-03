export default {
  data() {
    return {
      textEditorToolbar: [
        ["bold", "italic", "underline", "strike"],
        [
          { align: "" },
          { align: "center" },
          { align: "right" },
          { align: "justify" }
        ],
        [{ list: "ordered" }, { list: "bullet" }],
        [{ color: [] }, { background: [] }]
      ]
    }
  }
}